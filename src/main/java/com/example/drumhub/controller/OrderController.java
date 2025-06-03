package com.example.drumhub.controller;

import com.example.drumhub.dao.CartDAO;
import com.example.drumhub.dao.OrderDAO;
import com.example.drumhub.dao.models.Cart;
import com.example.drumhub.dao.models.Order;
import com.example.drumhub.dao.models.User;
import com.example.drumhub.services.OrderService;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}