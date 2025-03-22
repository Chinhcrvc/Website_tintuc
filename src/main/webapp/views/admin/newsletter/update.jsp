<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cập Nhật Newsletters</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_main">
		<h1>Cập Nhật Newsletters</h1>
		<form name="loaiTinForm"
			action="/Assignment_NVC/newsletter/update/${newsletter.email}"
			method="post" onsubmit=" return validateForm()">

			<label>Email:</label> <input class="main_new" type="text"
				name="email" value="${newsletter.email}" /> <label>Trạng
				thái:</label>
			<div class="radio-group">
				<label><input type="radio" name="enabled" value="true"
					${newsletter.enabled ? 'checked' : ''}> Còn</label> <label><input
					type="radio" name="enabled" value="false"
					${!newsletter.enabled ? 'checked' : ''}> Hết</label>
			</div>

			<div class="button_new">
				<button class="submit-button" type="submit">
					<i class="fas fa-edit"></i> Cập Nhật
				</button>
			</div>
		</form>
	</div>

	<script type="text/javascript"
		src="/Assignment_NVC/javascripts/validate.js"></script>
</body>
</html>
