<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/adminvc.css">
</head>
<body>
	<div class="container_admin">
		<footer>
			<div class="footer_admin">Welcome <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Guest" %></div>
		</footer>
	</div>
</body>
</html>