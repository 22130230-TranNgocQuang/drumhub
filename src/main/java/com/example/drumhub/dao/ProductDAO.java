package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductDAO {

    public List<Product> getAll() {
        Statement statement = DBConnect.getStatement();
        ResultSet rs = null;
        try {
            rs = statement.executeQuery("SELECT * FROM products");
            List<Product> re = new ArrayList<>();
            while (rs.next()){
                re.add(new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6)));
            }
            System.out.println("Total products: " + re.size());
            return re;
        } catch (SQLException e) {
            throw new RuntimeException(e.toString());
        }
    }

    public Product getById(int id) {
        Statement statement = DBConnect.getStatement();
        ResultSet rs = null;
        try {
            rs = statement.executeQuery("SELECT * FROM products where id = " + id);
            List<Product> re = new ArrayList<>();
            if (rs.next()){

                return new Product(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getDouble(4), rs.getBoolean(5), rs.getInt(6));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return null;
    }
    // Trong file ProductDao.java
    public static List<Product> search(String keyword) {
        Statement statement = DBConnect.getStatement();
        ResultSet rs = null;
        List<Product> result = new ArrayList<>();

        try {
            String sql = "SELECT * FROM products WHERE " +
                    "name LIKE '%" + keyword + "%' OR " +
                    "description LIKE '%" + keyword + "%'";
            rs = statement.executeQuery(sql);

            while (rs.next()) {
                Product product = new Product(
                        rs.getInt(1),      // id
                        rs.getString(2),   // name
                        rs.getString(3),   // description
                        rs.getDouble(4),   // price
                        rs.getBoolean(5),  // status
                        rs.getInt(6)       // categoryId
                );
                result.add(product);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error searching products", e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (statement != null) statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }
}
