package com.example.drumhub.services;

import com.example.drumhub.dao.UserDAO;
import com.example.drumhub.dao.UsersDashboardDAO;
import com.example.drumhub.dao.models.User;

import java.util.List;

public class UsersDashboardService {
    private UsersDashboardDAO dao = new UsersDashboardDAO();

    public List<User> getAll() {
        return dao.getAll();
    }

    public int count() {
        return dao.count();
    }

    public User getById(int id) {
        return dao.getById(id);
    }

    public void updateUser(User user) {
        dao.updateUser(user);
    }
    public void softDelete(int id) {
        dao.softDelete(id);
    }
    public void insert(User user) {
        dao.insert(user);
    }
}


