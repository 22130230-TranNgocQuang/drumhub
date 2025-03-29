package com.example.drumhub.dao.models;

import java.io.Serializable;

public class Cart implements Serializable {
    private int id;
    private Product product;
    private int userId;
    private int quantity;
    private double price;
    private int orderId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public Cart(int id, Product product, int userId, int quantity, double price, int orderId) {
        this.id = id;
        this.product = product;
        this.userId = userId;
        this.quantity = quantity;
        this.price = price;
        this.orderId = orderId;
    }

}
