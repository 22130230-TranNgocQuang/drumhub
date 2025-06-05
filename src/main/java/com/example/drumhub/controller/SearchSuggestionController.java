package com.example.drumhub.controller;

import com.example.drumhub.dao.ProductDAO;
import com.example.drumhub.dao.db.DBConnect;
import com.example.drumhub.dao.models.Product;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

@WebServlet("/search-suggestions")
public class SearchSuggestionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String query = request.getParameter("query");
        if (query == null || query.trim().isEmpty()) {
            response.setContentType("application/json");
            response.getWriter().write("[]");
            return;
        }

        try (Connection conn = DBConnect.getConnection()) {
            ProductDAO productDAO = new ProductDAO(conn);
            List<Product> suggestions = productDAO.searchSuggestions(query);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");

            PrintWriter out = response.getWriter();
            out.print(new Gson().toJson(suggestions));
            out.flush();

        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Server error\"}");
        }
    }
}
