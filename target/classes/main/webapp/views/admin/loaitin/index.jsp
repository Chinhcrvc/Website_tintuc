<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản Lý Loại Tin</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/adminvc.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
</head>
<body>
	<div class="container_QT">
		<h1>Quản Lý Loại Tin</h1>
		<c:if test="${not empty sessionScope.successMessage}">
			<script>
				alert("${sessionScope.successMessage}");
			</script>
			<c:remove var="successMessage" scope="session" />
		</c:if>
		<div>
			<a href="/Assignment_NVC/loaitin/create"><button
					class="action-button add-button">
					<i class="fas fa-plus-circle"></i> Thêm mới
				</button></a>
		</div>
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên Loại Tin</th>
					<th>Sửa</th>
					<th>Xóa</th>
				</tr>
			</thead>
			<c:forEach var="item" items="${categories}">
				<tr>
					<td>${item.id}</td>
					<td>${item.name}</td>
					<td><a href="/Assignment_NVC/loaitin/update/${item.id}"><button
								class="action-button edit-button">
								<i class="fas fa-edit"></i>Sửa
							</button></a></td>
					<td>
						<form action="/Assignment_NVC/loaitin/delete" method="post"
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
			return confirm("Bạn có chắc chắn muốn xóa loại tin này không?");
		}
	</script>
</body>
</html>