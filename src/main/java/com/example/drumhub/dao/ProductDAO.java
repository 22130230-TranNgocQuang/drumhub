package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
    private final Connection conn;

    public ProductDAO(Connection conn) {
        this.conn = conn;
    }

    public List<Product> getAll() {
        String sql = "SELECT * FROM products";
        List<Product> result = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                result.add(mapResultSetToProduct(rs));
            }
            System.out.println("Total products: " + result.size());
            return result;
        } catch (SQLException e) {
            throw new RuntimeException("Error loading products", e);
        }
    }

    public Product getById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return mapResultSetToProduct(rs);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error loading product with ID: " + id, e);
        }
        return null;
    }

    public List<Product> search(String keyword) {
        String sql = "SELECT * FROM products WHERE name LIKE ?";
        List<Product> result = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            String searchPattern = "%" + keyword + "%";
            stmt.setString(1, searchPattern);
            stmt.setString(2, searchPattern);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                result.add(mapResultSetToProduct(rs));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error searching products", e);
        }

        return result;
    }

    public List<Product> getListByN(int n) {
        String sql = "SELECT * FROM products LIMIT ?";
        List<Product> result = new ArrayList<>();

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, n);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                result.add(mapResultSetToProduct(rs));
            }

            System.out.println("Top " + n + " products: " + result.size());
            return result;
        } catch (SQLException e) {
            throw new RuntimeException("Error loading top N products", e);
        }
    }

    // ✅ Method mới: dùng để ẩn sản phẩm (ví dụ sau khi đặt hàng)
    public boolean markProductAsInactive(int productId) {
        String sql = "UPDATE products SET status = FALSE WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ✅ Hàm dùng lại để mapping dữ liệu
    private Product mapResultSetToProduct(ResultSet rs) throws SQLException {
        return new Product(
                rs.getInt("id"),
                rs.getString("name"),
                rs.getString("image"),
                rs.getDouble("price"),
                rs.getBoolean("status"),
                rs.getInt("categoryId")
        );
    }
    public List<Product> searchSuggestions(String query) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id, name FROM products WHERE name LIKE ? AND status != -1 LIMIT 10";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, "%" + query + "%");
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


}