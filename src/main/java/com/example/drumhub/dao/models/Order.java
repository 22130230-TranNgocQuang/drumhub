package com.example.drumhub.dao.models;

import java.sql.Timestamp;

public class Order {
    private int id;
    private int userId;
    private String fullName;
    private String phone;
    private String address;
    private Timestamp orderDate;
    private double totalPrice;
    private String status;

    public Order() {
    }

    public Order(int id, int userId, String fullName, String phone, String address,
                 Timestamp orderDate, double totalPrice, String status) {
        this.id = id;
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.orderDate = orderDate;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public Order(int userId, String fullName, String phone, String address,
                 double totalPrice, String status) {
        this.userId = userId;
        this.fullName = fullName;
        this.phone = phone;
        this.address = address;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }

    public void setUserId(int userId) { this.userId = userId; }

    public String getFullName() { return fullName; }

    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }

    public void setAddress(String address) { this.address = address; }

    public Timestamp getOrderDate() { return orderDate; }

    public void setOrderDate(Timestamp orderDate) { this.orderDate = orderDate; }

    public double getTotalPrice() { return totalPrice; }

    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getStatus() { return status; }

    public void setStatus(String status) { this.status = status; }
}