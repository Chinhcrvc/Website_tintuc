<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập nhật loại tin</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
        <h1>Cập nhật</h1>
        <form id="categoryForm" action="/Assignment_NVC/loaitin/update/${category.id}" method="post" onsubmit="return validateForm();">
    		<label>Mã loại tin:</label>
		    <input class="main_new" type="text" name="id" value="${category.id}" readonly />
		    <label>Tên Loại Tin:</label>
		    <input class="main_new" type="text" name="name" value="${category.name}" />
        	<div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-edit"></i> Cập nhật
			    </button>
			</div>
		</form>
		<script type="text/javascript" src="/Assignment_NVC/javascripst/loaitin.js"></script>
    </div>
</body>
</html>