package com.example.drumhub.services;

import com.example.drumhub.dao.UserDAO;

public class DashboardService {

    private UserDAO userDAO = new UserDAO();

    public boolean checkIsAdmin(String username) {
        return userDAO.isAdmin(username);
    }

    public int getTotalUsers() {
        return userDAO.countUsers();
    }

    // Tương tự nếu có DAO cho products, orders thì thêm method đếm
    public int getTotalProducts() {
        // TODO: gọi ProductDAO.countProducts()
        return 0;
    }

    public int getTotalOrders() {
        // TODO: gọi OrderDAO.countOrders()
        return 0;
    }
}
