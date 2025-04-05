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
            return null;
        }
    }
}
