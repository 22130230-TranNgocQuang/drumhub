package com.drumhub.web.drumhub.controllers.dashboard;

import com.drumhub.web.drumhub.models.Order;
import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.repositories.OrderRepository;
import com.drumhub.web.drumhub.services.OrderService;
import com.drumhub.web.drumhub.services.UserAddressService;
import com.drumhub.web.drumhub.services.UserService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/dashboard/orders/*")

public class OrderController extends ResourceController {
    private OrderService orderService;

    @Override
    public void init() {
        this.orderService = new OrderService();
    }

    @Override
    // danh sach cac don hang

    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lay ra danh sach tat ca don hang
        List<Order> orders = orderService.all();
        request.setAttribute("orders", orders);
        request.setAttribute("pageTitle", "Quản lý đơn hàng");
        request.setAttribute("content", "orders/index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    // chi tiet don hang
    public void show(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
//        System.out.println(1);
//        System.out.println(new OrderRepository().findWithDetails(Integer.parseInt(id)));
        Order order = orderService.findWithDetails(Integer.parseInt(id));
        request.setAttribute("order", order);
        request.setAttribute("pageTitle", "Chi tiết đơn hàng");
        request.setAttribute("content", "orders/show.jsp");  // hoặc file jsp tương ứng
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);

    }

    @Override
    //them
    public void create(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    // luu
    public void store(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        Order order = orderService.findWithDetails(Integer.parseInt(id));
        request.setAttribute("order", order);
        request.setAttribute("pageTitle", "Chỉnh sửa đơn hàng");
        request.setAttribute("content", "orders/edit.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response, String id) {

    }

    @Override
    public void delete(HttpServletRequest request, HttpServletResponse response, String id) {
        try {
            // Kiểm tra ID có hợp lệ hay không
            if (id == null || !id.matches("\\d+")) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID đơn hàng không hợp lệ");
                return;
            }

            // Chuyển ID từ String sang Integer
            int orderId = Integer.parseInt(id);

            // Gọi service để xóa đơn hàng
            boolean isDeleted = orderService.deleteOrder(orderId);

            if (isDeleted) {
                // Nếu xóa thành công, chuyển hướng về danh sách đơn hàng
                response.sendRedirect(request.getContextPath() + "/dashboard/orders");
            } else {
                // Nếu không tìm thấy đơn hàng hoặc không thể xóa
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy đơn hàng để xóa");
            }
        } catch (Exception e) {
            // Xử lý lỗi tổng quát
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    @Override
    //
    public void indexNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void showNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) {

    }

    @Override
    public void createNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void storeNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void editNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void updateNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

    }

    @Override
    public void deleteNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) {

    }

}
