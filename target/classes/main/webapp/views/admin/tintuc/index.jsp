<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Tin Tức</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_QT">
		<h1>Quản Lý Tin Tức</h1>
		<!-- Đoạn mã hiển thị thông báo -->
		<c:if test="${not empty sessionScope.message}">
			<script type="text/javascript">
				alert("${sessionScope.message}");
			</script>
			<c:remove var="message" scope="session" />
		</c:if>
		<div>
			<a href="/Assignment_NVC/tintuc/create"><button
					class="add-button">
					<i class="fas fa-plus-circle"></i> Thêm mới
				</button></a>
		</div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Tiêu Đề</th>
					<th>Nội Dung</th>
					<th>Ảnh</th>
					<th>Ngày Đăng</th>
					<th>Tác Giả</th>
					<th>Số Lượng Xem</th>
					<th>Loại Tin Tức</th>
					<th>Home</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<c:forEach var="item" items="${news}">
				<tr>
					<td>${item.id}</td>
					<td>${item.title}</td>
					<td title="${item.content}">${f:substring(item.content, 0, 50)}${item.content.length() > 50 ? '...' : ''}
					</td>

					<td><img
						src="${pageContext.request.contextPath}/${item.image}?t=${System.currentTimeMillis()}"
						alt="${item.title}" width="100" height="100"></td>
					<td><fmt:formatDate value="${item.postedDate}"
							pattern="dd-MM-yyyy HH:mm" /></td>
					<td>${item.author}</td>
					<td>${item.viewCount}</td>
					<td>${item.categoryName.name}</td>
					<td>${item.home ? 'Có' : 'Không'}</td>
					<td><a href="/Assignment_NVC/tintuc/update/${item.id}">
							<button class="action-button edit-button">
								<i class="fas fa-edit"></i>Sửa
							</button>
					</a></td>
					<td>
						<form action="/Assignment_NVC/tintuc/delete" method="post"
							onsubmit="return confirmDelete();">
							<input name="id" value="${item.id}" type="hidden">
							<button type="submit" class="action-button delete-button">
								<i class="fas fa-trash-alt"></i>Xóa
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function confirmDelete() {
			return confirm("Bạn có chắc chắn muốn xóa tin tức này không?");
		}
	</script>
</body>
</html>
