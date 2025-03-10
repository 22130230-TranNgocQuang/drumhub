package com.drumhub.web.drumhub.controllers.dashboard;

import com.drumhub.web.drumhub.models.Sale;
import com.drumhub.web.drumhub.services.SaleService;
import com.drumhub.web.drumhub.utils.Utils;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/dashboard/sales/*")
public class SaleManagerController extends ResourceController {
    private SaleService saleService;

    @Override
    public void init() {
        this.saleService = new SaleService();
    }

    @Override
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Sale> sales = saleService.all();
        request.setAttribute("sales", sales);
        request.setAttribute("pageTitle", "Quản lí chương trình giảm giá");
        request.setAttribute("content", "sales/index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void show(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Sale sale = saleService.findById(Integer.parseInt(id));
        request.setAttribute("sale", sale);
        request.setAttribute("pageTitle", "Xem chi tiết chương trình giảm giá");
        request.setAttribute("content", "sales/show.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("pageTitle", "Thêm chương trình giảm giá");
        request.setAttribute("content", "sales/create.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            Timestamp startDate = Timestamp.valueOf(request.getParameter("startDate"));
            Timestamp endDate = Timestamp.valueOf(request.getParameter("endDate"));

            Sale newSale = new Sale();
            newSale.setName(name);
            newSale.setDescription(description);
            newSale.setDiscountPercentage(discountPercentage);
            newSale.setStartDate(startDate);
            newSale.setEndDate(endDate);

            saleService.create(newSale);

            response.sendRedirect(request.getContextPath() + "/dashboard/sales");
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
        Sale sale = saleService.findById(Integer.parseInt(id));
        request.setAttribute("sale", sale);
        request.setAttribute("pageTitle", "Chỉnh sửa chương trình giảm giá");
        request.setAttribute("content", "sales/edit.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        if (!Utils.validateCsrfToken(request, response)) return;

        try {
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            double discountPercentage = Double.parseDouble(request.getParameter("discountPercentage"));
            Timestamp startDate = Timestamp.valueOf(request.getParameter("startDate"));
            Timestamp endDate = Timestamp.valueOf(request.getParameter("endDate"));

            Sale sale = new Sale();
            sale.setName(name);
            sale.setDescription(description);
            sale.setDiscountPercentage(discountPercentage);
            sale.setStartDate(startDate);
            sale.setEndDate(endDate);

            saleService.update(sale);

            response.sendRedirect(request.getContextPath() + "/dashboard/sales");
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
            saleService.delete(Integer.parseInt(id));

            response.sendRedirect(request.getContextPath() + "/dashboard/sales");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Xóa chương trình giảm giá thất bại: " + e.getMessage());
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
