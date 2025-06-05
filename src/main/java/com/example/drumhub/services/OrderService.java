package com.example.drumhub.services;

import com.example.drumhub.dao.models.Order;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderService {
    private final Connection conn;

    public OrderService(Connection conn) {
        this.conn = conn;
    }

    // CREATE
    public int createOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (userId, fullName, phone, address, totalPrice, status) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, order.getUserId());
            stmt.setString(2, order.getFullName());
            stmt.setString(3, order.getPhone());
            stmt.setString(4, order.getAddress());
            stmt.setDouble(5, order.getTotalPrice());
            stmt.setString(6, order.getStatus());

            int affectedRows = stmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Tạo đơn hàng thất bại, không có dòng nào được thêm.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Không lấy được ID của đơn hàng mới.");
                }
            }
        }
    }

    // READ (one)
    public Order getOrderById(int id) throws SQLException {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("userId"));
                order.setFullName(rs.getString("fullName"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                order.setStatus(rs.getString("status"));
                return order;
            }
            return null;
        }
    }

    // READ (all)
    public List<Order> getAllOrders() throws SQLException {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM orders";
        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("userId"));
                order.setFullName(rs.getString("fullName"));
                order.setPhone(rs.getString("phone"));
                order.setAddress(rs.getString("address"));
                order.setOrderDate(rs.getTimestamp("orderDate"));
                order.setTotalPrice(rs.getDouble("totalPrice"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        }
        return orders;
    }

    // UPDATE
    public boolean updateOrder(Order order) throws SQLException {
        String sql = "UPDATE orders SET userId = ?, fullName = ?, phone = ?, address = ?, totalPrice = ?, status = ? WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, order.getUserId());
            stmt.setString(2, order.getFullName());
            stmt.setString(3, order.getPhone());
            stmt.setString(4, order.getAddress());
            stmt.setDouble(5, order.getTotalPrice());
            stmt.setString(6, order.getStatus());
            stmt.setInt(7, order.getId());
            return stmt.executeUpdate() > 0;
        }
    }

    // DELETE
    public boolean deleteOrder(int id) throws SQLException {
        String sql = "DELETE FROM orders WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        }
    }
}
