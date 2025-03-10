package com.drumhub.web.drumhub.models;

public class CartItem {
    private Product product;
    private int quantity;
    private String color;

    public CartItem(Product product, int quantity, String color) {
        this.product = product;
        this.quantity = quantity;
        this.color = color;
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "product=" + product +
                ", quantity=" + quantity +
                ", color='" + color + '\'' +
                '}';
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public double getTotal() {
        return product.getSalePrice() * quantity;
    }
} 