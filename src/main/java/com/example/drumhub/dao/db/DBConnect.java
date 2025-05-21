package com.example.drumhub.dao.db;

import java.awt.*;
import java.sql.*;

public class DBConnect {
    static Connection conn;
    static String url = "jdbc:mysql://" + DBProperties.host() + ":" + DBProperties.port() + "/" + DBProperties.dbname() + "?" + DBProperties.option();

    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        if (conn == null || conn.isClosed()) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
        }
        return conn;
    }

    public static Statement getStatement(){
        try {
            if (conn == null || conn.isClosed()) {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, DBProperties.username(), DBProperties.password());
            }
            return conn.createStatement();
        } catch (SQLException e) {
            return null;
        } catch (ClassNotFoundException e) {
            return null;
        }
    }

    public static void main(String[] args) throws SQLException {
        Statement statement = getStatement();
        ResultSet rs = statement.executeQuery("SELECT * FROM products");
        while (rs.next()){
            System.out.println(rs.getInt(1) +
                    ", " + rs.getString(2) + '\'' +
                    ", " + rs.getString(3) + '\'' +
                    ", " + rs.getDouble(4) +
                    ", " + rs.getBoolean(5) +
                    ", " + rs.getInt(6)
            );
        }
    }
}