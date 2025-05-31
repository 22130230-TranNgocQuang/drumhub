package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UserDAO {

    public User authenticateUser(String username, String password) {
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            String sql = "SELECT * FROM users WHERE username = '" + username + "' AND password = '" + password + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }

    public boolean registerUser(User user) {
        Statement stmt = DBConnect.getStatement();
        try {
            String sql = String.format("INSERT INTO users (username, password, email, fullName, role, status) " +
                            "VALUES ('%s', '%s', '%s', '%s', '%s', %d)",  // Sử dụng %d thay vì %b để truyền giá trị int cho status
                    user.getUsername(), user.getPassword(), user.getEmail(), user.getFullName(),
                    user.getRole(), user.getStatus());  // status được truyền là int
            return stmt.executeUpdate(sql) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean deleteUser(int id) {
        Statement stmt = DBConnect.getStatement();
        try {
            String sql = "DELETE FROM users WHERE id = " + id;
            return stmt.executeUpdate(sql) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean updateUserRole(int id, String newRole) {
        Statement stmt = DBConnect.getStatement();
        try {
            String sql = "UPDATE users SET role = '" + newRole + "' WHERE id = " + id;
            return stmt.executeUpdate(sql) > 0;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<User> getAllUsers() {
        List<User> list = new ArrayList<>();
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            rs = stmt.executeQuery("SELECT * FROM users");
            while (rs.next()) {
                list.add(extractUser(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return list;
    }

    public User findUserByUsername(String username) {
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            String sql = "SELECT * FROM users WHERE username = '" + username + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) return extractUser(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public User findUserByEmail(String email) {
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            String sql = "SELECT * FROM users WHERE email = '" + email + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                return extractUser(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    public boolean registerGoogleUser(User user) {
        String sql = "INSERT INTO users (username, password, email, fullName, role, status) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setString(1, user.getUsername());
            ps.setString(2, "");
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getUsername());
            ps.setInt(5, user.getRole());
            ps.setInt(6, user.getStatus());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkEmailExists(String email) {
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            String sql = "SELECT * FROM users WHERE email = '" + email + "'";
            rs = stmt.executeQuery(sql);
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public boolean checkUsernameExists(String username) {
        Statement stmt = DBConnect.getStatement();
        ResultSet rs;
        try {
            String sql = "SELECT * FROM users WHERE username = '" + username + "'";
            rs = stmt.executeQuery(sql);
            return rs.next();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("id"),
                rs.getString("username"),
                rs.getString("password"),
                rs.getString("email"),
                rs.getString("fullName"),
                rs.getInt("role"),
                rs.getInt("status"),  // status được lấy là kiểu int từ cơ sở dữ liệu
                rs.getTimestamp("createdAt")
        );
    }
    public boolean updateUserStatusByEmail(String email) {
        String sql = "UPDATE users SET status = 1 WHERE email = ?";
        try (Connection conn = DBConnect.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            return ps.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }

}
