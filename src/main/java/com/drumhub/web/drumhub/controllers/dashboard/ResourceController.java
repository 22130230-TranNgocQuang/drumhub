package com.drumhub.web.drumhub.controllers.dashboard;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public abstract class ResourceController extends HttpServlet implements AbstractController, NestedController {
    protected String[] getPathParts(String pathInfo) {
        if (pathInfo == null) return new String[0];
        return pathInfo.substring(1).split("/");
    }

    protected boolean isNumeric(String str) {
        return str.matches("\\d+");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        String pathInfo = request.getPathInfo();
        String[] parts = getPathParts(pathInfo);

        try {
            if (parts.length == 0) {
                // GET /users - Lấy danh sách tất cả người dùng (hiển thị trang index)
                index(request, response);
            } else if (parts.length == 1 && isNumeric(parts[0])) {
                // GET /users/5 - Lấy thông tin của một người dùng cụ thể (show user với ID = 5)
                show(request, response, parts[0]);
            } else if (parts.length == 1 && parts[0].equals("create")) {
                // GET /users/create - Hiển thị form tạo người dùng mới
                create(request, response);
            } else if (parts.length == 2 && isNumeric(parts[0]) && parts[1].equals("edit")) {
                // GET /users/5/edit - Hiển thị form chỉnh sửa người dùng với ID = 5
                edit(request, response, parts[0]);
            } else if (parts.length == 2 && isNumeric(parts[0])) {
                // GET /users/5/posts or /users/5/addresses etc. - Lấy thông tin các tài nguyên con của người dùng (posts hoặc addresses)
                NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                indexNested(request, response, parts[0], resourceType);
            } else if (parts.length == 3 && isNumeric(parts[0]) && parts[2].equals("create")) {
                // GET /users/5/posts/create or /users/5/addresses/create etc. - Hiển thị form tạo tài nguyên con (posts hoặc addresses) cho người dùng với ID = 5
                NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                createNested(request, response, parts[0], resourceType);
            } else if (parts.length == 3 && isNumeric(parts[0]) && isNumeric(parts[2])) {
                // GET /users/5/posts/1 or /users/5/addresses/1 etc. - Lấy thông tin tài nguyên con cụ thể (post hoặc address) với ID = 1 của người dùng với ID = 5
                NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                showNested(request, response, parts[0], parts[2], resourceType);
            } else if (parts.length == 4 && isNumeric(parts[0]) && isNumeric(parts[2]) && parts[3].equals("edit")) {
                // GET /users/5/posts/1/edit or /users/5/addresses/1/edit etc. - Hiển thị form chỉnh sửa tài nguyên con (post hoặc address) với ID = 1 của người dùng với ID = 5
                NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                editNested(request, response, parts[0], parts[2], resourceType);
            }
        } catch (IllegalArgumentException e) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND); // Trả về mã lỗi 404 nếu không tìm thấy route phù hợp
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Trả về mã lỗi 500 nếu có lỗi hệ thống
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        String pathInfo = request.getPathInfo();
        String[] parts = getPathParts(pathInfo);
        String methodOverride = request.getParameter("_method");

        try {
            if (methodOverride != null && methodOverride.equalsIgnoreCase("PUT")) {
                // Xử lý PUT request
                if (parts.length == 1 && isNumeric(parts[0])) {
                    // PUT /users/5 - Cập nhật người dùng với ID = 5
                    update(request, response, parts[0]);
                } else if (parts.length == 3 && isNumeric(parts[0]) && isNumeric(parts[2])) {
                    // PUT /users/5/posts/1 or /users/5/addresses/1 etc. - Cập nhật tài nguyên con với ID = 1 của người dùng với ID = 5
                    NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                    updateNested(request, response, parts[0], parts[2], resourceType);
                }
            } else if (methodOverride != null && methodOverride.equalsIgnoreCase("DELETE")) {
                // Xử lý DELETE request
                if (parts.length == 1 && isNumeric(parts[0])) {
                    // DELETE /users/5 - Xóa người dùng với ID = 5
                    delete(request, response, parts[0]);
                } else if (parts.length == 3 && isNumeric(parts[0]) && isNumeric(parts[2])) {
                    // DELETE /users/5/posts/1 or /users/5/addresses/1 etc. - Xóa tài nguyên con với ID = 1 của người dùng với ID = 5
                    NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                    deleteNested(request, response, parts[0], parts[2], resourceType);
                }
            } else {
                // Xử lý POST request thông thường
                if (parts.length == 0) {
                    // POST /users - Tạo mới người dùng
                    store(request, response);
                } else if (parts.length == 2 && isNumeric(parts[0])) {
                    // POST /users/5/posts or /users/5/addresses etc. - Tạo mới tài nguyên con (post hoặc address) cho người dùng với ID = 5
                    NestedResourceType resourceType = NestedResourceType.fromPath(parts[1]);
                    storeNested(request, response, parts[0], resourceType);
                }
            }
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Trả về mã lỗi 500 nếu có lỗi hệ thống
        }
    }


}
