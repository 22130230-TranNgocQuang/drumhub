package com.example.drumhub.services;

import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.Connection;
import java.util.List;

public class ProductService {
    private final ProductDAO dao;

    public ProductService(Connection conn) {
        this.dao = new ProductDAO(conn);
    }

    public ProductService() {
        try {
            Connection conn = DBConnect.getConnection();
            dao = new ProductDAO(conn);
        } catch (Exception e) {
            throw new RuntimeException("Không thể khởi tạo ProductService", e);
        }
    }

    public List<Product> getAll() {
        return dao.getAll();
    }

    public List<Product> getListByN() {
        return dao.getListByN(12);
    }

    public Product getDetail(String in) {
        try {
            int id = Integer.parseInt(in);
            return dao.getById(id);
        } catch (NumberFormatException e) {
            return null;
        }
    }

    public Product getDetailById(int id) {
        return dao.getById(id);
    }

    public List<Product> search(String keyword) {
        return dao.search(keyword);
    }

    public boolean hideProduct(int productId) {
        return dao.markProductAsInactive(productId);
    }
}