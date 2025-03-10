package com.drumhub.web.drumhub.controllers;

import com.drumhub.web.drumhub.models.District;
import com.drumhub.web.drumhub.models.Province;
import com.drumhub.web.drumhub.models.Ward;
import com.drumhub.web.drumhub.repositories.DistrictRepository;
import com.drumhub.web.drumhub.repositories.ProvinceRepository;
import com.drumhub.web.drumhub.repositories.WardRepository;
import com.drumhub.web.drumhub.services.LocationService;
import com.drumhub.web.drumhub.utils.DBConnection;
import com.google.gson.Gson;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jdbi.v3.core.Jdbi;

import java.io.IOException;
import java.util.List;

@WebServlet("/location")
public class LocationController extends HttpServlet {

    private LocationService locationService;

    @Override
    public void init() {
        Jdbi jdbi = DBConnection.getJdbi();
        locationService = new LocationService(
                new ProvinceRepository(jdbi),
                new DistrictRepository(jdbi),
                new WardRepository(jdbi)
        );
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if (action == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action is required");
            return;
        }

        switch (action) {
            case "provinces" -> handleGetProvinces(response);
            case "districts" -> handleGetDistricts(request, response);
            case "wards" -> handleGetWards(request, response);
            default -> response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found");
        }
    }

    private void handleGetProvinces(HttpServletResponse response) throws IOException {
        List<Province> provinces = locationService.getAllProvinces();
        writeResponse(response, provinces);
    }

    private void handleGetDistricts(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String provinceIdParam = request.getParameter("provinceId");
        if (provinceIdParam == null || provinceIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "provinceId is required");
            return;
        }

        int provinceId = Integer.parseInt(provinceIdParam);
        List<District> districts = locationService.getDistrictsByProvinceId(provinceId);
        writeResponse(response, districts);
    }

    private void handleGetWards(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String districtIdParam = request.getParameter("districtId");
        if (districtIdParam == null || districtIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "districtId is required");
            return;
        }

        int districtId = Integer.parseInt(districtIdParam);
        List<Ward> wards = locationService.getWardsByDistrictId(districtId);
        writeResponse(response, wards);
    }

    private void writeResponse(HttpServletResponse response, Object data) throws IOException {
        String jsonResponse = new Gson().toJson(data);
        response.getWriter().write(jsonResponse);
    }
}
