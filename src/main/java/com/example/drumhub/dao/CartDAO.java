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

    // Xoá cart chưa thanh toán với userId và productId (cho flow Mua ngay)
    public boolean deleteUnorderedCartsByProduct(int userId, int productId) {
        String sql = "DELETE FROM carts WHERE userId = ? AND productId = ? AND orderId IS NULL";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            stmt.setInt(2, productId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    //lấy danh sách cart cho user kèm thông tin sp
    public List<Cart> getCartByUserWithoutOrder(int userId) {
        List<Cart> carts = new ArrayList<>();
        String sql = "SELECT c.*, " +
                "p.name AS productName, p.image AS productImage, " +
                "p.price AS productPrice " +
                "FROM carts c " +
                "JOIN products p ON c.productId = p.id " +
                "WHERE c.userId = ? AND c.orderId IS NULL";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Cart cart = new Cart();
                Product product = new Product();

                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setImage(rs.getString("productImage"));

                cart.setId(rs.getInt("id"));
                cart.setProduct(product);
                cart.setUserId(rs.getInt("userId"));
                cart.setQuantity(rs.getInt("quantity"));
                cart.setPrice(rs.getDouble("productPrice"));
                cart.setOrderId(rs.getInt("orderId"));
                carts.add(cart);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return carts;
    }

    public boolean updateQuantity(int cartId, int userId, int quantity) {
        String sql = "UPDATE carts SET quantity = ? WHERE id = ? AND userId = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, quantity);
            stmt.setInt(2, cartId);
            stmt.setInt(3, userId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


}
