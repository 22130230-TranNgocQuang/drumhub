package com.drumhub.web.drumhub.utils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class Utils {
    public static boolean validateCsrfToken(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String csrfToken = request.getParameter("csrf_token");
        HttpSession session = request.getSession();
        String sessionToken = (String) session.getAttribute("csrfToken");

        if (sessionToken == null || !sessionToken.equals(csrfToken)) {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "CSRF token is invalid");
            return false;
        }
        return true;
    }

}
