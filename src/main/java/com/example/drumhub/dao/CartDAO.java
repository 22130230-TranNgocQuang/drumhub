package com.example.drumhub.dao;

import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class CartDAO {
    ProductDAO productDAO = new ProductDAO();

    public boolean addCart(int productId, int quantity, int userId, double price) {
        Statement statement = DBConnect.getStatement();
        ResultSet rs = null;
    }

}
