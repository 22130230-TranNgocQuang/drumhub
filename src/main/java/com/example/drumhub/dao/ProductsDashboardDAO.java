package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;
import com.example.drumhub.dao.models.Category;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductsDashboardDAO {

    // Lấy danh sách sản phẩm active (status = 1)
    public List<Product> getAllActive() {
        String sql = "SELECT * FROM products WHERE status = 1";
        List<Product> products = new ArrayList<>();

        try (Statement st = DBConnect.getStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getDouble("price"),
                        rs.getBoolean("status"),
                        rs.getInt("categoryId")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh sách sản phẩm", e);
        }
        return products;
    }

    // Lấy sản phẩm theo id
    public Product getById(int id) {
        String sql = "SELECT * FROM products WHERE id = ?";
        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new Product(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("image"),
                            rs.getDouble("price"),
                            rs.getBoolean("status"),
                            rs.getInt("categoryId")
                    );
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi lấy sản phẩm theo id", e);
        }
        return null;
    }

    // Cập nhật sản phẩm
    public void updateProduct(Product product) {
        String sql = "UPDATE products SET name = ?, image = ?, price = ?, status = ?, categoryId = ? WHERE id = ?";
        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setBoolean(4, product.isStatus());
            ps.setInt(5, product.getCategoryId());
            ps.setInt(6, product.getId());
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi cập nhật sản phẩm", e);
        }
    }

    // Lấy danh sách categories (có đầy đủ thông tin)
    public List<Category> getAllCategories() {
        String sql = "SELECT * FROM categories ORDER BY name";
        List<Category> categories = new ArrayList<>();
        try (Statement st = DBConnect.getStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                categories.add(new Category(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("image"),
                        rs.getString("description"),
                        rs.getTimestamp("createdAt")
                ));
            }
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi lấy danh mục", e);
        }
        return categories;
    }

    // Ẩn sản phẩm (status = -1)
    public void softDelete(int id) {
        String sql = "UPDATE products SET status = -1 WHERE id = ?";
        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi ẩn sản phẩm", e);
        }
    }
    public void insertProduct(Product product) {
        String sql = "INSERT INTO products (name, image, price, status, categoryId) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setString(1, product.getName());
            ps.setString(2, product.getImage());
            ps.setDouble(3, product.getPrice());
            ps.setBoolean(4, product.isStatus());
            ps.setInt(5, product.getCategoryId());
            ps.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException("Lỗi khi thêm sản phẩm", e);
        }
    }

}