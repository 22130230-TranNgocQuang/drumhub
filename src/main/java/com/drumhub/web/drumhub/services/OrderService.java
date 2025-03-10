package com.drumhub.web.drumhub.services;

import com.drumhub.web.drumhub.models.Order;
import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.repositories.OrderRepository;
import com.drumhub.web.drumhub.repositories.UserRepository;

import java.util.List;
import java.util.Map;

public class OrderService {
    private final OrderRepository orderRepository = new OrderRepository();

    public List<Order> all() {
        return orderRepository.all();
    }


    public Order find(int id) {
        return orderRepository.find(id);
    }

    public Order findWithDetails(int id) {
        return orderRepository.findWithDetails(id);
    }
    public boolean deleteOrder(int orderId) {
        return orderRepository.deleteOrder(orderId);  // Gọi phương thức xóa trong Repository
    }



}
