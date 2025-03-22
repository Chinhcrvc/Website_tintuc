<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pháp luật</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/usersss.css">
</head>
<body>
	<!-- section 1 -->
	<section>
		<div class="row_1 boxcenter_1">
			<div class="left_1">
				<!-- Hiển thị bài viết chính (bài đầu tiên) -->
				<c:forEach var="news" items="${plnewsList}" varStatus="status">
					<c:if test="${status.index == 0}">
						<div class="lastnews_left_1">
							<div class="image_1">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									<img src="${pageContext.request.contextPath}/${news.image}"
									alt="${news.title}" />
								</a>
							</div>
							<div class="text_1">
								<div class="text_title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title}</a>
								</div>
								<div class="text_content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}...<!-- Giới hạn 100 ký tự -->
									</a>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>

				<!-- Hiển thị các bài viết phụ (bài thứ 2 và thứ 3) -->
				<div class="row_1 duongke_1">
					<c:forEach var="news" items="${plnewsList}" varStatus="status">
						<c:if test="${status.index > 0 && status.index < 4}">
							<div class="col_left lastnews_left_1_1">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									<img src="${pageContext.request.contextPath}/${news.image}"
									alt="${news.title}" />
								</a> <a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col_right right_1">
				<a href="#"><img src="/Assignment_NVC/image/bannerphapluat.png" alt="" /></a>
			</div>
		</div>
	</section>
	<!-- section 2 -->
	<section>
		<div class="row_2 boxcenter_2">
			<div class="left_2_pl">
				<c:forEach var="news" items="${plnewsList}" varStatus="status">
					<c:if test="${status.index >= 4 && status.index <= 12}">
						<div class="title_2_pl">
							<a
								href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
								${news.title} </a>
						</div>
						<div class="lastnews_left_2_pl">
							<div class="image_2_pl">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"><img
									src="${pageContext.request.contextPath}/${news.image}"
									alt="${news.title}" /></a>
							</div>
							<div class="text_2_pl">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${f:substring(news.content, 0, 100)}... </a>
							</div>
						</div>
						<hr />
					</c:if>
				</c:forEach>

				<c:forEach var="news" items="${plnewsList}" varStatus="status">
					<c:if test="${status.index == 13}">
						<div class="title_2_pl">
							<a
								href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
								${news.title} </a>
						</div>
						<div class="lastnews_left_2_pl">
							<div class="image_2_pl">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"><img
									src="${pageContext.request.contextPath}/${news.image}"
									alt="${news.title}" /></a>
							</div>
							<div class="text_2_pl">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${f:substring(news.content, 0, 100)}... </a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<div class="main-container-wrapper">
				<div class="main-container">
					<!-- Bài viết chính bên trái -->
					<div class="left-container">
						<c:forEach var="news" items="${plnewsList}" varStatus="status">
							<c:if test="${status.index == 14}">
								<div class="main-image">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										<img src="${pageContext.request.contextPath}/${news.image}"
										alt="${news.title}" />
									</a>
								</div>
								<div class="main-title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="main-content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}... </a>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Các bài viết phụ bên phải -->
					<div class="right-container">
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index >= 15 && status.index <= 16}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index == 17}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--///2/// -->
				<div class="main-container">
					<!-- Bài viết chính bên trái -->
					<div class="left-container">
						<c:forEach var="news" items="${plnewsList}" varStatus="status">
							<c:if test="${status.index == 18}">
								<div class="main-image">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										<img src="${pageContext.request.contextPath}/${news.image}"
										alt="${news.title}" />
									</a>
								</div>
								<div class="main-title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="main-content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}... </a>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Các bài viết phụ bên phải -->
					<div class="right-container">
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index >= 19 && status.index <= 20}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index == 21}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--///3/// -->
				<div class="main-container">
					<!-- Bài viết chính bên trái -->
					<div class="left-container">
						<c:forEach var="news" items="${plnewsList}" varStatus="status">
							<c:if test="${status.index == 22}">
								<div class="main-image">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										<img src="${pageContext.request.contextPath}/${news.image}"
										alt="${news.title}" />
									</a>
								</div>
								<div class="main-title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="main-content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}... </a>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Các bài viết phụ bên phải -->
					<div class="right-container">
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index >= 23 && status.index <= 24}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index == 25}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--///4/// -->
				<div class="main-container">
					<!-- Bài viết chính bên trái -->
					<div class="left-container">
						<c:forEach var="news" items="${plnewsList}" varStatus="status">
							<c:if test="${status.index == 26}">
								<div class="main-image">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										<img src="${pageContext.request.contextPath}/${news.image}"
										alt="${news.title}" />
									</a>
								</div>
								<div class="main-title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="main-content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}... </a>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Các bài viết phụ bên phải -->
					<div class="right-container">
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index >= 27 && status.index <= 28}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index == 29}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
				<!--///5/// -->
				<div class="main-container">
					<!-- Bài viết chính bên trái -->
					<div class="left-container">
						<c:forEach var="news" items="${plnewsList}" varStatus="status">
							<c:if test="${status.index == 30}">
								<div class="main-image">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										<img src="${pageContext.request.contextPath}/${news.image}"
										alt="${news.title}" />
									</a>
								</div>
								<div class="main-title">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="main-content">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${f:substring(news.content, 0, 100)}... </a>
								</div>
							</c:if>
						</c:forEach>
					</div>

					<!-- Các bài viết phụ bên phải -->
					<div class="right-container">
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index >= 31 && status.index <= 32}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
									<hr>
								</c:if>
							</c:forEach>
						</div>
						<div class="sub-article">
							<c:forEach var="news" items="${plnewsList}" varStatus="status">
								<c:if test="${status.index == 33}">
									<div class="sub-title">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
									<div class="sub-content">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>