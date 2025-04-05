package com.example.drumhub.services;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Product;

import java.sql.SQLException;

public class CartService {
    private CartDAO cartDAO ;

    public CartService() throws SQLException {
        cartDAO = new CartDAO();
    }

    public boolean addCart(int productId, int quantity, double price) {
        boolean result = false;
        try{
            ProductService service = new ProductService();
            Product product = service.getDetailById(productId);
            int userId = 0;
            int orderId = 0;
            Cart cart = new Cart(productId, product, userId, quantity, price, orderId);

            result = cartDAO.addCart(cart);

            return result;
        } catch(NumberFormatException e){
            return false;
        }


    }
}
