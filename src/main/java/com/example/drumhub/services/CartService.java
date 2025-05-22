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

    public boolean addCart(int userId, int productId, int quantity, double price) {
        boolean result = false;
        try{
            ProductService service = new ProductService();
            Product product = service.getDetailById(productId);
            int orderId = 0;
            Cart cart = new Cart(productId, product, userId, quantity, price, orderId);

            result = cartDAO.addCart(cart);

            return result;
        } catch(Exception e){
            e.printStackTrace();
            return false;
        }


    }
}
