package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.OrderDetailItem;
import com.example.drumhub.dao.models.User;

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

    public Order getById(int id) {
        String sql = "SELECT * FROM orders WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, id);
            ResultSet rs = pst.executeQuery();
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
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi lấy đơn hàng theo id", e);
        }
        return null;
    }

    public boolean updateStatus(int id, String status) {
        String sql = "UPDATE orders SET status = ? WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setString(1, status);
            pst.setInt(2, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi cập nhật trạng thái đơn hàng", e);
        }
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM orders WHERE id = ?";
        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, id);
            return pst.executeUpdate() > 0;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi xóa đơn hàng", e);
        }
    }

    public List<OrderDetailItem> getOrderDetailsByOrderId(int orderId) {
        List<OrderDetailItem> items = new ArrayList<>();

        String sql = """
            SELECT c.id AS cartId,
                   p.id AS productId,
                   p.name,
                   (
                    SELECT pi.image
                    FROM productImages pi
                    WHERE pi.productId = p.id
                    LIMIT 1
                   ) AS image,
                   c.quantity,
                   c.price
            FROM carts c
            JOIN products p ON c.productId = p.id
            LEFT JOIN productImages pi ON pi.productId = p.id
            WHERE c.orderId = ?
        """;

        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, orderId);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                OrderDetailItem item = new OrderDetailItem();
                item.setCartId(rs.getInt("cartId"));
                item.setProductId(rs.getInt("productId"));
                item.setProductName(rs.getString("name"));
                item.setProductImage(rs.getString("image"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                items.add(item);
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi lấy chi tiết đơn hàng", e);
        }
        return items;
    }

    public User getUserByOrderId(int orderId) {
        String sql = """
            SELECT u.*
            FROM orders o
            JOIN users u ON o.userId = u.id
            WHERE o.id = ?
        """;

        try (PreparedStatement pst = DBConnect.getConnection().prepareStatement(sql)) {
            pst.setInt(1, orderId);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setUsername(rs.getString("username"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullName"));
                user.setRole(rs.getInt("role"));
                user.setStatus(rs.getInt("status"));
                return user;
            }
        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi lấy người đặt đơn hàng", e);
        }

        return null;
    }
}
