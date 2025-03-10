package com.drumhub.web.drumhub.controllers.dashboard;

import com.drumhub.web.drumhub.models.Brand;
import com.drumhub.web.drumhub.services.BrandService;
import com.drumhub.web.drumhub.utils.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/brands/*")
public class BrandManagerController extends ResourceController {
    private BrandService brandService;

    @Override
    public void init() {
        this.brandService = new BrandService();
    }

    @Override
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Brand> brands = brandService.all();
        request.setAttribute("brands", brands);
        request.setAttribute("pageTitle", "Quản lí thương hiệu");
        request.setAttribute("content", "brands/index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void show(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Brand brand = brandService.findById(Integer.parseInt(id));
        request.setAttribute("brand", brand);
        request.setAttribute("pageTitle", "Xem chi tiết thương hiệu");
        request.setAttribute("content", "brands/show.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("pageTitle", "Thêm thương hiệu");
        request.setAttribute("content", "brands/create.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");

            Brand newBrand = new Brand();
            newBrand.setName(name);
            newBrand.setImage(image);
            newBrand.setDescription(description);

            brandService.create(newBrand);

            response.sendRedirect(request.getContextPath() + "/dashboard/brands");
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
            create(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            create(request, response);
        }
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Brand brand = brandService.findById(Integer.parseInt(id));
        request.setAttribute("brand", brand);
        request.setAttribute("pageTitle", "Chỉnh sửa thương hiệu");
        request.setAttribute("content", "brands/edit.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String image = request.getParameter("image");
            String description = request.getParameter("description");

            Brand brand = brandService.findById(Integer.parseInt(id));
            brand.setName(name);
            brand.setImage(image);
            brand.setDescription(description);

            brandService.update(brand);

            response.sendRedirect(request.getContextPath() + "/dashboard/brands");
        } catch (NumberFormatException | NullPointerException e) {
            request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
            edit(request, response, id);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
            edit(request, response, id);
        }
    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;
        try {
            brandService.delete(Integer.parseInt(id));

            response.sendRedirect(request.getContextPath() + "/dashboard/brands");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Xóa thương hiệu thất bại: " + e.getMessage());
            index(request, response);
        }
    }

    @Override
    public void indexNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void showNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void createNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void storeNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void editNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void updateNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void deleteNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }
}
