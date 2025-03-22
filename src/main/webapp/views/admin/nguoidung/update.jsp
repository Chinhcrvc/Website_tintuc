<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật Người Dùng</title>
<link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/adminnvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
    <div class="container_main">
        <h1>Cập nhật Người Dùng</h1>
        <form id="userForm" action="/Assignment_NVC/nguoidung/update/${user.id}" method="post" onsubmit="return validateForm();">
        	<label>Mã loại tin:</label>
            <input class="main_new" type="text" name="id" value="${user.id}" readonly/>
            
            <label>Mật khẩu:</label>
            <input class="main_new" type="password" name="password" value="${user.password}"/>
            
            <label>Họ và tên:</label>
            <input class="main_new" type="text" name="fullName" value="${user.fullName}"/>
            
            <label>Ngày sinh:</label>
            <input class="main_new" type="date" name="birthDay" value="<fmt:formatDate value='${user.birthDay}' pattern='yyyy-MM-dd'/>" />
            
            <label>Giới tính:</label>
            <div class="radio-group">
            <label><input type="radio" name="gender" value="true" ${user.gender ? 'checked' : ''}/>Nam</label>
            <label><input type="radio" name="gender" value="false" ${!user.gender ? 'checked' : ''}/>Nữ</label>
            </div>
            
            <label>Điện thoại:</label>
            <input class="main_new" type="text" name="moble" value="${user.moble}"/>
            
            <label>Email:</label>
            <input class="main_new" type="text" name="email" value="${user.email}"/>
            
            <label>Vai trò:</label>
            <select class="main_new" name="role">
            	 <option value="true" ${user.role ? 'selected' : ''}>Quản trị</option>
                 <option value="false" ${!user.role ? 'selected' : ''}>Phóng viên</option>
            </select>
             <div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-edit"></i> Cập nhật
			    </button>
			</div>
        </form>
    </div>
    <script type="text/javascript" src="/Assignment_NVC/javascripst/nguoidung.js"></script>
</body>
</html>
