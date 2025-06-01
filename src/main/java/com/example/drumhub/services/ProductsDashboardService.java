package com.example.drumhub.services;

import com.example.drumhub.dao.ProductDashboardDAO;
import com.example.drumhub.dao.models.Product;

import java.util.List;

public class ProductDashboardService {
    private ProductDashboardDAO dao = new ProductDashboardDAO();

    public List<Product> getAll() {
        return dao.getAllActive();
    }

    public void softDelete(int id) {
        dao.softDelete(id);
    }
}
