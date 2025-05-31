package com.example.drumhub.controller;

import com.example.drumhub.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/verify")
public class VerifyEmailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        if (email == null || email.isEmpty()) {
            response.sendRedirect("verify-success.jsp?status=fail");
            return;
        }

        UserDAO dao = new UserDAO();
        boolean success = dao.updateUserStatusByEmail(email);

        if (success) {
            response.sendRedirect("verify-success.jsp?status=success");
        } else {
            response.sendRedirect("verify-success.jsp?status=fail");
        }
    }
}
