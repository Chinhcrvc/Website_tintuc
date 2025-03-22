<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Loại Tin</title>
<link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
		<h1>Thêm Loại Tin</h1>
		<form id="categoryForm" action="/Assignment_NVC/loaitin/create" method="post" onsubmit="return validateForm();">
			<label>Mã loại tin:</label>
			<input name="id" type="text" class="main_new" />
			<label>Tên Loại Tin:</label> 
			<input  name="name" type="text" class="main_new" />
			<div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-plus"></i> Thêm mới
			    </button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="/Assignment_NVC/javascripst/loaitin.js"></script>
</body>
</html>