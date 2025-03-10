package com.drumhub.web.drumhub.controllers.dashboard;

import com.drumhub.web.drumhub.models.User;
import com.drumhub.web.drumhub.models.UserAddress;
import com.drumhub.web.drumhub.services.UserAddressService;
import com.drumhub.web.drumhub.services.UserService;
import com.drumhub.web.drumhub.utils.Utils;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import org.mindrot.jbcrypt.BCrypt;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(value = "/dashboard/users/*", loadOnStartup = 1)
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024, // 1 MB
        maxFileSize = 1024 * 1024 * 10,  // 10 MB
        maxRequestSize = 1024 * 1024 * 15 // 15 MB
)
public class UserManagerController extends ResourceController {
    private UserService userService;
    private UserAddressService userAddressService;

    @Override
    public void init() {
        this.userService = new UserService();
        this.userAddressService = new UserAddressService();
    }

    @Override
    public void indexNested(HttpServletRequest request, HttpServletResponse response, String userId, NestedResourceType resourceType) {
        switch (resourceType) {
            case POSTS:
                // Xử lý hiển thị danh sách bài posts
                break;
            case ADDRESSES:
                System.out.println("day la addresses");
                break;
            case ORDERS:
                // Xử lý hiển thị danh sách đơn hàng
                break;
            case WISHLISTS:
                // Xử lý hiển thị danh sách wishlist
                break;
        }
    }

    @Override
    public void showNested(HttpServletRequest request, HttpServletResponse response, String userId, String id, NestedResourceType resourceType) {
        switch (resourceType) {
            case POSTS:
                // Hiển thị chi tiết một bài post
                break;
            case ADDRESSES:
                System.out.println("day la addresses voi id la: " + id);
                break;
            case ORDERS:
                // Hiển thị chi tiết một đơn hàng
                break;
            case WISHLISTS:
                // Hiển thị chi tiết một wishlist
                break;
        }
    }

    @Override
    public void createNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void storeNested(HttpServletRequest request, HttpServletResponse response, String parentId, NestedResourceType resourceType) {

    }

    @Override
    public void editNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {
        System.out.println("day la editNested");
        switch (resourceType) {
            case POSTS:
                // Hiển thị chi tiết một bài post
                break;
            case ADDRESSES:
                UserAddress address = userAddressService.find(Integer.parseInt(id));
                request.setAttribute("address", address);
                request.setAttribute("pageTitle", "Chỉnh sửa địa chỉ");
                request.setAttribute("content", "users/addresses/edit.jsp");
                request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
                break;
            case ORDERS:
                // Hiển thị chi tiết một đơn hàng
                break;
            case WISHLISTS:
                // Hiển thị chi tiết một wishlist
                break;
        }
    }

    @Override
    public void updateNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws ServletException, IOException {

        switch (resourceType) {
            case POSTS:
                // Hiển thị chi tiết một bài post
                break;
            case ADDRESSES:
                try {
                    String address = request.getParameter("address");
                    String phone = request.getParameter("phone");
                    int provinceId = Integer.parseInt(request.getParameter("provinceId"));
                    int districtId = Integer.parseInt(request.getParameter("districtId"));
                    int wardId = Integer.parseInt(request.getParameter("wardId"));
                    System.out.println("isdefault: " + request.getParameter("isDefault"));
                    boolean isDefault = Boolean.parseBoolean(request.getParameter("isDefault"));

                    // Tạo đối tượng UserAddress
                    UserAddress userAddress = new UserAddress();
                    userAddress.setId(Integer.parseInt(id));
                    userAddress.setUserId(Integer.parseInt(parentId));
                    userAddress.setAddress(address);
                    userAddress.setPhone(phone);
                    userAddress.setProvinceId(provinceId);
                    userAddress.setDistrictId(districtId);
                    userAddress.setWardId(wardId);
                    userAddress.setIsDefault(isDefault);

                    userAddressService.update(userAddress);

                    // Redirect
                    response.sendRedirect(request.getContextPath() + "/dashboard/users/" + parentId + "/edit");
                } catch (NumberFormatException | NullPointerException e) {
                    request.setAttribute("error", "Dữ liệu đầu vào không hợp lệ.");
                    editNested(request, response, parentId, id, resourceType);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Cập nhật thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                }
                break;
            case ORDERS:
                // Hiển thị chi tiết một đơn hàng
                break;
            case WISHLISTS:
                // Hiển thị chi tiết một wishlist
                break;
        }
    }

    @Override
    public void deleteNested(HttpServletRequest request, HttpServletResponse response, String parentId, String id, NestedResourceType resourceType) throws IOException, ServletException {
        switch (resourceType) {
            case POSTS:
                // Hiển thị chi tiết một bài post
                break;
            case ADDRESSES:
                try {
                    userAddressService.delete(Integer.parseInt(id));
                    response.sendRedirect(request.getContextPath() + "/dashboard/users/" + parentId + "/edit");
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", "Xóa địa chỉ thất bại: " + e.getMessage());
                    editNested(request, response, parentId, id, resourceType);
                }
                break;
            case ORDERS:
                // Hiển thị chi tiết một đơn hàng
                break;
            case WISHLISTS:
                // Hiển thị chi tiết một wishlist
                break;
        }
    }

    @Override
    public void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userService.all();
        request.setAttribute("users", users);
        request.setAttribute("pageTitle", "Quản lý người dùng");
        request.setAttribute("content", "users/index.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void show(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        User user = userService.detail(Integer.parseInt(id));
        request.setAttribute("user", user);
        request.setAttribute("pageTitle", "Chi tiết người dùng");
        request.setAttribute("content", "users/show.jsp");  // hoặc file jsp tương ứng
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("pageTitle", "Thêm người dùng");
        request.setAttribute("content", "users/create.jsp");  // hoặc file jsp tương ứng
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void store(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Debug: in ra tất cả các parts
            for (Part part : request.getParts()) {
                System.out.println("Part name: " + part.getName());
                if (part.getContentType() == null) { // Nếu là form field
                    byte[] bytes = part.getInputStream().readAllBytes();
                    String value = new String(bytes);
                    System.out.println("Value: " + value);
                }
            }

            // Lấy thông tin user từ form sử dụng Part
            String fullname = getPartValue(request, "fullname");
            String email = getPartValue(request, "email");
            String password = getPartValue(request, "password");
            String confirmPassword = getPartValue(request, "confirmPassword");
            String roleStr = getPartValue(request, "role");
            String statusStr = getPartValue(request, "status");
            String addressesJson = getPartValue(request, "addressesJson");

            System.out.println("roleStr: " + roleStr);
            System.out.println("statusStr: " + statusStr);

            // Validate dữ liệu
            if (roleStr == null || roleStr.trim().isEmpty()) {
                request.setAttribute("error", "Vui lòng chọn quyền người dùng");
                create(request, response);
                return;
            }

            int role = Integer.parseInt(roleStr);
            int status = Integer.parseInt(statusStr);

            // Validate dữ liệu
            if (!password.equals(confirmPassword)) {
                request.setAttribute("error", "Mật khẩu xác nhận không khớp");
                create(request, response);
                return;
            }

            // Kiểm tra email tồn tại
            if (userService.isEmailExists(email)) {
                request.setAttribute("error", "Email đã tồn tại trong hệ thống");
                create(request, response);
                return;
            }

            // Xử lý upload avatar
            String avatarFileName = null;
            Part avatarPart = request.getPart("avatar");
            if (avatarPart != null && avatarPart.getSize() > 0) {
                // Lấy đường dẫn thực tế đến thư mục assets/images/data
                String uploadPath = request.getServletContext().getRealPath("/assets/images/data");
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                // Tạo tên file unique
                avatarFileName = System.currentTimeMillis() + "_" +
                        avatarPart.getSubmittedFileName().toLowerCase().replaceAll("\\s+", "_");

                // Lưu file
                avatarPart.write(uploadPath + File.separator + avatarFileName);
            }

            // Tạo đối tượng User
            User user = new User();
            user.setFullname(fullname);
            user.setEmail(email);
            user.setPassword(BCrypt.hashpw(password, BCrypt.gensalt()));
            user.setRole(role);
            user.setStatus(status);
            if (avatarFileName != null) {
                user.setAvatar(avatarFileName); // Chỉ lưu tên file vào database
            }

            // Parse địa chỉ từ JSON và lưu user
            List<UserAddress> addresses = new ArrayList<>();
            if (addressesJson != null && !addressesJson.isEmpty()) {
                ObjectMapper mapper = new ObjectMapper();
                mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
                addresses = mapper.readValue(addressesJson,
                        mapper.getTypeFactory().constructCollectionType(List.class, UserAddress.class));
            }

            userService.createWithAddresses(user, addresses);

            response.sendRedirect(request.getContextPath() + "/dashboard/users");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Tạo người dùng thất bại: " + e.getMessage());
            create(request, response);
        }
    }

    // Thêm helper method để đọc giá trị từ Part
    private String getPartValue(HttpServletRequest request, String partName) throws ServletException, IOException {
        Part part = request.getPart(partName);
        if (part != null) {
            byte[] bytes = part.getInputStream().readAllBytes();
            return new String(bytes).trim();
        }
        return null;
    }

    @Override
    public void edit(HttpServletRequest request, HttpServletResponse response, String id) throws ServletException, IOException {
        User user = userService.detail(Integer.parseInt(id));
        request.setAttribute("user", user);
        request.setAttribute("pageTitle", "Chỉnh sửa người dùng");
        request.setAttribute("content", "users/edit.jsp");
        request.getRequestDispatcher("/pages/dashboard/layout.jsp").forward(request, response);
    }

    @Override
    public void update(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {

        try {
            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");

            User user = userService.detail(Integer.parseInt(id));
            user.setFullname(fullname);
            user.setEmail(email);

            userService.update(user);

            // Redirect về trang danh sách người dùng
            response.sendRedirect(request.getContextPath() + "/dashboard/users");
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
    public void delete(HttpServletRequest request, HttpServletResponse response, String id) throws IOException, ServletException {


        try {
            userService.delete(Integer.parseInt(id));

            response.sendRedirect(request.getContextPath() + "/dashboard/users");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Xóa người dùng thất bại: " + e.getMessage());
            index(request, response);
        }
    }

    // Thêm helper method để validate file ảnh
    private boolean isImageFile(Part part) {
        String contentType = part.getContentType();
        return contentType != null && contentType.startsWith("image/");
    }

}
