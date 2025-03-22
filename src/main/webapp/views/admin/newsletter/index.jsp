<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Newsletters</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>
<body>
	<div class="container_QT">
		<h1>Quản Lý Newsletters</h1>

		<!-- Đoạn mã hiển thị thông báo -->
		<c:if test="${not empty sessionScope.message}">
			<script type="text/javascript">
				alert("${sessionScope.message}");
			</script>
			<c:remove var="message" scope="session" />
		</c:if>

		<div>
			<a href="/Assignment_NVC/newsletter/create"><button
					class="add-button">
					<i class="fas fa-plus-circle"></i> Thêm mới
				</button></a>
		</div>

		<table>
			<thead>
				<tr>
					<th>Email</th>
					<th>Trạng Thái</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
			</thead>

			<c:forEach var="item" items="${newsletter}">
				<tr>
					<td>${item.email}</td>
					<td>${item.enabled ? 'Còn hiệu lực' : 'Hết hiệu lực'}</td>
					<td><a href="/Assignment_NVC/newsletter/update/${item.email}">
							<button class="action-button edit-button">
								<i class="fas fa-edit"></i> Sửa
							</button>
					</a></td>
					<td>
						<form action="/Assignment_NVC/newsletter/delete" method="post"
							onsubmit="return confirmDelete();">
							<input name="email" value="${item.email}" type="hidden">
							<button type="submit" class="action-button delete-button">
								<i class="fas fa-trash-alt"></i> Xóa
							</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<script type="text/javascript">
		function confirmDelete() {
			return confirm("Bạn có chắc chắn muốn xóa email này không?");
		}
	</script>
</body>
</html>
