<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assignment</title>
<link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/usersss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>
<body>
	<jsp:include page="layouts/banner.jsp"></jsp:include>
	<jsp:include page="layouts/header.jsp"></jsp:include>
	<jsp:include page="layouts/nav.jsp"></jsp:include>
	<jsp:include page="${view}"></jsp:include>
	<jsp:include page="layouts/aside.jsp"></jsp:include>
	<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>