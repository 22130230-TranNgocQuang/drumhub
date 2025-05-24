package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrdersDashboardDAO {

    public List<Order> getAll() {
        String sql = "SELECT * FROM orders ORDER BY orderDate DESC";
        List<Order> orders = new ArrayList<>();

        try (Statement st = DBConnect.getStatement();
             ResultSet rs = st.executeQuery(sql)) {

            while (rs.next()) {
                orders.add(new Order(
                        rs.getInt("id"),
                        rs.getInt("userId"),
                        rs.getTimestamp("orderDate"),
                        rs.getDouble("totalPrice"),
                        rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi truy vấn đơn hàng", e);
        }

        return orders;
    }

    public int count() {
        try (Statement st = DBConnect.getStatement()) {
            ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM orders");
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return 0;
    }

    // Thêm method lấy 1 order theo id (phục vụ edit)
    public Order getById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                return new Order(
                        rs.getInt("id"),
                        rs.getInt("userId"),
                        rs.getTimestamp("orderDate"),
                        rs.getDouble("totalPrice"),
                        rs.getString("status")
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi lấy đơn hàng theo id", e);
        }
        return null;
    }

    // Thêm method cập nhật trạng thái đơn hàng
    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setString(1, status);
            pst.setInt(2, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi cập nhật trạng thái đơn hàng", e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    // Thêm method xóa đơn hàng
    public boolean delete(int id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi xóa đơn hàng", e);
        }
    }
}
