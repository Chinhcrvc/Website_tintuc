<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thêm Newsletters</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
		<h1>Thêm Newsletters</h1>
		<form id="newsletterForm" action="/Assignment_NVC/newsletter/create" method="post" onsubmit="return validateForm();">
			
			<label>Email:</label> 
			<input class="main_new" type="email" name="email" required /> 

			<label>Trạng thái:</label>
			<div class="radio-group">
			    <label><input type="radio" name="enabled" value="true" required />Còn</label>
			    <label><input type="radio" name="enabled" value="false" required />Hết</label>
			</div>

			<div class="button_new"> 
			    <button class="submit-button" type="submit">
			        <i class="fas fa-plus"></i> Thêm mới
			    </button>
			</div>
		</form>
	</div>

	<script type="text/javascript" src="/Assignment_NVC/javascripst/newsletter.js"></script>
</body>
</html>
