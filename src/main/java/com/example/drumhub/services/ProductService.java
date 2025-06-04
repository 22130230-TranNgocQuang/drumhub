package com.example.drumhub.services;

import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class ProductService {
    static ProductDAO dao = new ProductDAO();

    public List<Product> getAll() {return dao.getAll();}
    public List<Product> getListByN() {return dao.getListByN(12);}
    public Product getDetail(String in){
        try {
            int id = Integer.parseInt(in);
            return dao.getById(id);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public Product getDetailById(int id) {
        try {
            return dao.getById(id);
        } catch (NumberFormatException e) {
            System.err.println("Lỗi khi gọi getById(" + id + "): " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    // Trong file ProductService.java
    public List<Product> search(String keyword) {
        // Triển khai logic tìm kiếm
        return ProductDAO.search(keyword);
    }
}
