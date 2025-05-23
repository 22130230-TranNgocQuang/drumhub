package com.example.drumhub.dao.models;

import java.io.Serializable;

public class Product implements Serializable {
    private int id;
    private String name;
    private String image;
    private double price;
    private boolean status;
    private int categoryId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public Product(int id, String name, String image, double price, boolean status, int categoryId) {
        this.id = id;
        this.name = name;
        this.image = image;
        this.price = price;
        this.status = status;
        this.categoryId = categoryId;
    }

    public Product() {}

    @Override
    public String toString() {
        return  id +
                ", " + name + '\'' +
                ", " + image + '\'' +
                ", " + price +
                ", " + status +
                ", " + categoryId
                ;
    }
}
