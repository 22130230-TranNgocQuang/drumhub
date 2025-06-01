package com.example.drumhub;

import com.example.drumhub.dao.db.DBConnect;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import java.sql.Connection;

@WebListener
public class AppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        try {
            Connection conn = DBConnect.getConnection();
            sce.getServletContext().setAttribute("DBConnection", conn);
            System.out.println("==> DBConnection đã được gắn vào ServletContext: " + conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            Connection conn = (Connection) sce.getServletContext().getAttribute("DBConnection");
            if (conn != null && !conn.isClosed()) {
                conn.close();
                System.out.println("==> Đã đóng DBConnection khi app shutdown.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
