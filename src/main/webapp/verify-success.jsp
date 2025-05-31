<%@ page contentType="text/html;charset=UTF-8" %>
<%
    String status = request.getParameter("status"); // "success" hoặc "fail"
%>
<!DOCTYPE html>
<html>
<head>
    <title>Kết quả xác thực</title>
    <style>
        body {
            background-color: #fffde7;
            color: #5d4037;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            flex-direction: column;
        }
        .box {
            text-align: center;
            padding: 40px;
            border-radius: 12px;
            background: #fff9c4;
            box-shadow: 0 0 20px rgba(255, 235, 59, 0.2);
        }
    </style>
</head>
<body>
<div class="box" style="font-size: 30px;">
    <% if ("success".equals(status)) { %>
    <h2>Xác thực thành công!</h2>
    <p>Bạn có thể <a href="login.jsp">đăng nhập</a> ngay bây giờ.</p>
    <% } else { %>
    <h2>Xác thực thất bại!</h2>
    <p>Link không hợp lệ hoặc email đã được xác thực trước đó.</p>
    <% } %>
</div>
</body>
</html>
