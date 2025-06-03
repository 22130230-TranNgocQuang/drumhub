package com.example.drumhub.dao.models;

public class OrderDetailItem {
    private int cartId;
    private int productId;
    private String productName;
    private String productImage;
    private int quantity;
    private double price;

    public OrderDetailItem() {
        this.cartId = cartId;
        this.price = price;
        this.quantity = quantity;
        this.productImage = productImage;
        this.productName = productName;
        this.productId = productId;
    }

    public int getCartId() {
        return cartId;
    }

    public void setCartId(int cartId) {
        this.cartId = cartId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }
// Constructor, getters, setters
}

