<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/usersss.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>
<body>
	<div class="container">
		<header>
			<div class="logo">
				<img src="/Assignment_NVC/images/logo.svg" alt="" />
			</div>
			<div class="tinmoinhat">
				<a href="/Assignment_NVC/news/moinhat_nhieunhat_daxem">Mới nhất</a>
			</div>
			<div class="login">
				<a href="/Assignment_NVC/dangnhap"><i class="fa-regular fa-user"></i>
					Đăng nhập</a>
			</div>
			<div class="search">
				<form action="/Assignment_NVC/search" method="get">
					<i class="fa-solid fa-magnifying-glass"></i> <input type="text"
						name="keyword" placeholder="Tìm kiếm nội dung"
						class="form-control" />
					<button type="submit" style="display: none;"></button>
					<!-- Thêm nút submit ẩn -->
				</form>
			</div>
		</header>
	</div>
</body>
</html>