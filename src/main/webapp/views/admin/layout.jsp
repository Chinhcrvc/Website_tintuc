<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assignment</title>
 <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/admins.css">
  </head>
  <body>
    <jsp:include page="layouts/header.jsp"></jsp:include>
	<jsp:include page="layouts/nav.jsp"></jsp:include>
	<div class="content">
		<jsp:include page="${view}"></jsp:include>
	</div>
	<jsp:include page="layouts/footer.jsp"></jsp:include>
  </body>
</html>