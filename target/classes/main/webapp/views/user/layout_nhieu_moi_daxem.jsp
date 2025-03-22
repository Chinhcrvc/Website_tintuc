<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lịch sử bài viết</title>
</head>
<body>
	<jsp:include page="layouts/banner.jsp"></jsp:include>
	<jsp:include page="layouts/header.jsp"></jsp:include>
	<jsp:include page="layouts/nav.jsp"></jsp:include>
	<jsp:include page="${view}"></jsp:include>
	<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>