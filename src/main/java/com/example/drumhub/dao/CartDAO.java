package com.example.drumhub.dao;

import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    private Connection conn;

    public CartDAO(Connection conn) throws SQLException {
        this.conn = conn;
    }

    // Thêm sản phẩm vào giỏ hàng
    public boolean addCart(Cart cart) {
        String sql = "INSERT INTO carts (productId, userId, quantity, price, orderId) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cart.getProduct().getId());
            stmt.setInt(2, cart.getUserId());
            stmt.setInt(3, cart.getQuantity());
            stmt.setDouble(4, cart.getPrice());

            if (cart.getOrderId() == 0) {
                stmt.setNull(5, Types.INTEGER);
            } else {
                stmt.setInt(5, cart.getOrderId());
            }

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Gán orderId vào các cart chưa có order của user
    public boolean assignOrderIdToCartItems(int userId, int orderId) throws SQLException {
        String sql = "UPDATE carts SET orderId = ? WHERE userId = ? AND orderId IS NULL";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, orderId);
            stmt.setInt(2, userId);
            return stmt.executeUpdate() > 0;
        }
    }

    // Xoá tất cả cart chưa thanh toán của user
    public boolean deleteUnorderedCartsByUser(int userId) {
        String sql = "DELETE FROM carts WHERE userId = ? AND orderId IS NULL";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Helper: chuyển ResultSet thành Cart
    private Cart mapResultSetToCart(ResultSet rs) throws SQLException {
        Cart cart = new Cart();
        Product product = new Product();
        product.setId(rs.getInt("productId"));

        cart.setId(rs.getInt("id"));
        cart.setProduct(product); // Chỉ set ID; nếu cần đầy đủ, bạn phải gọi ProductDAO.getById()
        cart.setUserId(rs.getInt("userId"));
        cart.setQuantity(rs.getInt("quantity"));
        cart.setPrice(rs.getDouble("price"));
        cart.setOrderId(rs.getInt("orderId"));

        return cart;
    }

    public List<Cart> getCartByUserWithoutOrder(int userId) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT * FROM carts WHERE userId = ? AND orderId IS NULL";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                carts.add(mapResultSetToCart(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

}
