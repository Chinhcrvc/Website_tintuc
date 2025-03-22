<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sửa Tin Tức</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
		<h1>Cập Nhật Tin Tức</h1>
		<form id="newsForm" action="/Assignment_NVC/tintuc/update/${news.id}" method="post" enctype="multipart/form-data" onsubmit="return validateForm();">
			<label>Mã tin tức:</label> 
			<input class="main_new" type="text" name="id" value="${news.id}" readonly /> 
			<label>Tiêu đề:</label> 
			<input class="main_new" type="text" name="title" value="${news.title}" /> 
			<label>Nội dung:</label>
			<textarea class="main_new textarea_new" name="content">${news.content}</textarea>
			<label>Hình ảnh:</label> 
			<input class="main_new" type="file" name="image" /> 
			<%-- <label>Ngày đăng:</label> 
			<input class="main_new" type="date" name="postedDate" value="<fmt:formatDate value='${news.postedDate}' pattern='yyyy-MM-dd'/>" />  --%>
			<label>Tác giả:</label> 
			<input class="main_new" name="author" value="${news.author}"> <br> 
			<label>Số lượt xem:</label> 
			<input class="main_new" type="number" name="viewCount" value="${news.viewCount}" readonly/> 
			<label>Loại tin tức:</label> 
			<select class="main_new" name="categoryId">
       		 <c:forEach var="category" items="${categories}">
            	<option value="${category.id}" ${category.id == news.categoryId ? 'selected' : ''}>${category.name}</option>
        	</c:forEach>
    		</select>
			<label>Home:</label>
			<div class="radio-group">
			<label><input type="radio" name="home" value="true" <c:if test="${news.home}">checked</c:if>/>Có</label> 
			<label><input type="radio" name="home" value="false" <c:if test="${!news.home}">checked</c:if>/>Không </label>
			</div>
			<div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-edit"></i> Cập nhật
			    </button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="/Assignment_NVC/javascripst/tintuc.js"></script>
</body>
</html>
