<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<style type="text/css">
.search-container {
	width: 80%;
	margin: 30px auto;
}

h1 {
	margin-bottom: 20px;
}

.search-bar {
	display: flex;
	margin-bottom: 20px;
}

.search-bar input {
	flex: 1;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px 0 0 5px;
	font-size: 16px;
}

.search-bar button {
	padding: 10px 20px;
	border: 1px solid #ccc;
	border-left: none;
	background-color: #333;
	color: white;
	border-radius: 0 5px 5px 0;
	cursor: pointer;
}

.articles {
	display: flex;
	flex-direction: column;
	gap: 20px;
}

.news {
	display: flex;
	text-decoration: none;
	overflow: hidden;
	padding-bottom: 20px;
	border-bottom: 2px solid #ccc;
}

.news-img {
	width: 200px;
	height: 100%;
}

.news-img img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.news-content {
	padding-left: 20px;
}

.news-title {
	display: block;
	font-size: 18px;
	color: #333;
	margin-bottom: 10px;
	text-decoration: none;
}

.news-title h2 {
	margin: 0;
	color: #333;
}

.news-text {
	font-size: 14px;
	color: #666;
	text-decoration: none;
}

.news-text p {
	margin: 0;
}

.message {
	color: red;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<div class="search-container">
		<h1>Kết quả tìm kiếm</h1>

		<!-- Thanh tìm kiếm -->
		<form action="/Assignment_NVC/search" method="get"
			class="search-bar">
			<input type="text" name="keyword"
				placeholder="Nhập từ khóa cần tìm kiếm" value="${param.keyword}">
			<button type="submit">
				<i class="fa fa-search"></i>
			</button>
		</form>

		<!-- Hiển thị thông báo lỗi nếu không có kết quả hoặc từ khóa rỗng -->
		<c:if test="${not empty message}">
			<p class="message">${message}</p>
		</c:if>

		<!-- Hiển thị danh sách kết quả tìm kiếm chỉ khi newsList có dữ liệu -->
		<c:if test="${not empty newsList}">
			<div class="articles">
				<c:forEach var="news" items="${newsList}">
					<div class="news">
						<a
							href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
							class="news-img"> <img
							src="${pageContext.request.contextPath}/${news.image}"
							alt="${news.title}">
						</a>
						<div class="news-content">
							<a
								href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
								class="news-title">
								<h2>${news.title}</h2>
							</a> <a
								href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
								class="news-text">
								<p>${f:substring(news.content, 0, 100)}...</p>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>
</html>