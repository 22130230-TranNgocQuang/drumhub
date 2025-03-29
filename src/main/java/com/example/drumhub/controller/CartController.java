package com.example.drumhub.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "addCart";
        }

        switch (action) {
            case "addCart":
                addCart(request, response);
                break;

        }
    }

    private void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}