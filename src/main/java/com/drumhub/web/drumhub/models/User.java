package com.drumhub.web.drumhub.models;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class User {
    private int id;
    private String email;
    private String password;
    private String fullname;
    private int role;
    private int status;
    private String phone;
    private String avatar;
    private Timestamp createdAt;

    private List<UserAddress> userAddresses;

    public User() {
        userAddresses = new ArrayList<>();
    }

    public User(String fullname, String phone, String hashedPassword, String email) {
        this.fullname = fullname;
        this.password = hashedPassword;
        this.email = email;
        this.userAddresses = new ArrayList<>();
        this.phone = phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void addAddress(UserAddress address) {
        userAddresses.add(address);
    }

    public UserAddress getAddress(int index) {
        return userAddresses.get(index);
    }

    public List<UserAddress> getUserAddresses() {
        return userAddresses;
    }

    public void setUserAddresses(List<UserAddress> userAddresses) {
        this.userAddresses = userAddresses;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", fullname='" + fullname + '\'' +
                ", role=" + role +
                ", status=" + status +
                ", phone='" + phone + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createdAt=" + createdAt +
                ", userAddresses=" + userAddresses +
                '}';
    }

    public boolean isAdmin() {
        return role == 1;
    }
}
