package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDashboardDAO {

    public List<Product> getAllActive() {
        String sql = "SELECT * FROM products WHERE status = TRUE";
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

    public void softDelete(int id) {
        String sql = "UPDATE products SET status = FALSE WHERE id = ?";
        try (PreparedStatement ps = DBConnect.getConnection().prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi ẩn sản phẩm", e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
