<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trang Quản trị</title>
    <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/adminvc.css">
</head>
<body>
    <div class="container_admin">
        <nav>
            <ul class="admin_menu">
                <li><a href="/Assignment_NVC/users/trangchu">Trang chủ</a></li>
                <li><a href="/Assignment_NVC/tintuc/index">Tin tức</a></li>

                <!-- Kiểm tra vai trò của người dùng -->
                <c:if test="${sessionScope.currentUser.role}">
                    <!-- Chỉ hiển thị các mục sau cho quản trị -->
                    <li><a href="/Assignment_NVC/loaitin/index">Loại tin</a></li>
                    <li><a href="/Assignment_NVC/nguoidung/index">Người dùng</a></li>
                    <li><a href="/Assignment_NVC/newsletter/index">Newsletter</a></li>
                </c:if>
            </ul>
        </nav>
    </div>
</body>
</html>
