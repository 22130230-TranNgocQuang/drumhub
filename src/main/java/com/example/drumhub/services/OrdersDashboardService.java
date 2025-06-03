package com.example.drumhub.services;

import com.example.drumhub.dao.OrdersDashboardDAO;
import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.OrderDetailItem;
import com.example.drumhub.dao.models.User;

import java.util.List;

public class OrdersDashboardService {
    private OrdersDashboardDAO dao = new OrdersDashboardDAO();

    public List<Order> getAll() {
        return dao.getAll();
    }

    public int count() {
        return dao.count();
    }

    public Order getById(int id) {
        return dao.getById(id);
    }

    public boolean updateStatus(int id, String status) {
        return dao.updateStatus(id, status);
    }

    public boolean delete(int id) {
        return dao.delete(id);
    }
    public List<OrderDetailItem> getOrderDetailsByOrderId(int orderId) {
        return dao.getOrderDetailsByOrderId(orderId);
    }

    public User getUserByOrderId(int orderId) {
        return dao.getUserByOrderId(orderId);
    }
}
