package com.example.drumhub.services;

import com.example.drumhub.dao.ProductsDashboardDAO;
import com.example.drumhub.dao.models.Category;
import com.example.drumhub.dao.models.Product;

import java.util.List;

public class ProductsDashboardService {
    private ProductsDashboardDAO dao = new ProductsDashboardDAO();

    public List<Product> getAll() {
        return dao.getAllActive();
    }

    public Product getById(int id) {
        return dao.getById(id);
    }

    public void updateProduct(Product product) {
        dao.updateProduct(product);
    }

    public void addProduct(Product product) {
        dao.insertProduct(product);
    }

    public void softDelete(int id) {
        dao.softDelete(id);
    }

    public List<Category> getAllCategories() {
        return dao.getAllCategories();
    }
}
