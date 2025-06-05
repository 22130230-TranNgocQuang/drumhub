package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Log;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LogDAO {

    public void insertLog(Log log) {
        String sql = "INSERT INTO logs (log_time, level, location, resource, actor, old_data, new_data) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setObject(1, log.getLogTime());
            ps.setString(2, log.getLevel());
            ps.setString(3, log.getLocation());
            ps.setString(4, log.getResource());
            ps.setString(5, log.getActor());
            ps.setString(6, log.getOldData());
            ps.setString(7, log.getNewData());

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
