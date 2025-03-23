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
        return re;
        } catch (SQLException e) {
            throw new RuntimeException(e);
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
}
