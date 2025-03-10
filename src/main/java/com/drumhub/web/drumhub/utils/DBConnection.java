package com.drumhub.web.drumhub.utils;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.jdbi.v3.core.Jdbi;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DBConnection {
    private static final Logger logger = LoggerFactory.getLogger(DBConnection.class);
    private static volatile Jdbi jdbi;
    private static HikariDataSource dataSource;

    private DBConnection() {
        // Prevent instantiation
    }

    static {
        // Add shutdown hook
        Runtime.getRuntime().addShutdownHook(new Thread(DBConnection::closeDataSource));
    }

    public static Jdbi getJdbi() {
        if (jdbi == null) {
            synchronized (DBConnection.class) {
                if (jdbi == null) {
                    initializeJdbi();
                }
            }
        }
        return jdbi;
    }

    private static void initializeJdbi() {
        Properties prop = loadProperties();
        HikariConfig config = createHikariConfig(prop);
        setupDataSource(config);
    }

    private static Properties loadProperties() {
        Properties prop = new Properties();
        try (InputStream inputStream = DBConnection.class.getClassLoader()
                .getResourceAsStream("db.properties")) {
            if (inputStream == null) {
                throw new RuntimeException("db.properties not found in classpath");
            }
            prop.load(inputStream);
            return prop;
        } catch (IOException e) {
            logger.error("Failed to load database properties", e);
            throw new RuntimeException("Could not load DB properties", e);
        }
    }

    private static HikariConfig createHikariConfig(Properties prop) {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(prop.getProperty("db.url"));
        config.setUsername(prop.getProperty("db.username"));
        config.setPassword(prop.getProperty("db.password"));
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");

        // Connection pool settings
        config.setMaximumPoolSize(10);
        config.setMinimumIdle(2);
        config.setIdleTimeout(300000); // 5 minutes
        config.setMaxLifetime(1800000); // 30 minutes
        config.setConnectionTimeout(30000); // 30 seconds
        config.setValidationTimeout(5000); // 5 seconds

        // Connection testing
        config.setConnectionTestQuery("SELECT 1");
        config.setPoolName("DrumStorePool");

        // Performance optimization
        config.addDataSourceProperty("cachePrepStmts", "true");
        config.addDataSourceProperty("prepStmtCacheSize", "250");
        config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");
        config.addDataSourceProperty("useServerPrepStmts", "true");

        return config;
    }

    private static void setupDataSource(HikariConfig config) {
        try {
            dataSource = new HikariDataSource(config);
            jdbi = Jdbi.create(dataSource);
            logger.info("Database connection pool initialized successfully");
        } catch (Exception e) {
            logger.error("Failed to initialize database connection pool", e);
            throw new RuntimeException("Failed to initialize database connection", e);
        }
    }

    public static void closeDataSource() {
        if (dataSource != null && !dataSource.isClosed()) {
            try {
                // Đóng tất cả connections đang active
                dataSource.getHikariPoolMXBean().softEvictConnections();
                // Đợi một chút để connections được đóng
                Thread.sleep(100);
                // Đóng datasource
                dataSource.close();
                logger.info("Database connection pool closed successfully");
            } catch (Exception e) {
                logger.error("Error closing database connection pool", e);
            }
        }
    }
}