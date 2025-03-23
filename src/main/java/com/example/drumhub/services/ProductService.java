package com.example.drumhub.services;

import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.models.Product;

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
}
