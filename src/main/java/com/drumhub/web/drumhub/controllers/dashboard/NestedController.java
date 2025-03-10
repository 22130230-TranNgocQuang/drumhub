package com.drumhub.web.drumhub.controllers.dashboard;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public interface NestedController {
    void indexNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException;

    void showNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException;

    void createNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException;

    void storeNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException;

    void editNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException;

    void updateNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException;

    void deleteNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException;
}
