<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Người Dùng</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
		<h1>Thêm Người Dùng</h1>
		<form id="userForm" action="/Assignment_NVC/nguoidung/create" method="post" onsubmit="return validateForm();">
			<label>Mã loại tin:</label> 
			<input class="main_new" type="text" name="id" />
			<label>Mật khẩu:</label> 
			<input class="main_new" type="password" name="password" /> 
			<label>Họ và tên:</label> 
			<input class="main_new" type="text" name="fullName" /> 
			<label>Ngày sinh:</label> 
			<input class="main_new" type="date" name="birthDay" /> 
			<label>Giới tính:</label> 
			<div class="radio-group">
			<label><input type="radio" name="gender" value="true" />Nam</label>
			<label><input type="radio" name="gender" value="false" />Nữ</label>
			</div>
			<label>Điện thoại:</label> 
			<input class="main_new" type="text" name="moble" /> 
			<label>Email:</label> 
			<input class="main_new" type="text" name="email" /> 
			<label>Vai trò:</label> <select class="main_new" name="role">
				<option value="true">Quản trị</option>
				<option value="false">Phóng viên</option>
			</select>
			<div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-plus"></i> Thêm mới
			    </button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="/Assignment_NVC/javascripst/nguoidung.js"></script>
</body>
</html>