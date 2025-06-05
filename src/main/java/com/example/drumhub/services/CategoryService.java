package com.example.drumhub.services;

import com.example.drumhub.dao.CategoryDAO;
import com.example.drumhub.dao.models.Category;

import java.sql.Connection;
import java.util.List;

public class CategoryService {

    private CategoryDAO categoryDAO;

    public CategoryService(Connection conn) {
        this.categoryDAO = new CategoryDAO(conn);
    }

    public List<Category> getAll() {
        return categoryDAO.getAll();
    }
}

