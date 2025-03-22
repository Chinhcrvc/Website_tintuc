<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thế giới</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/usersss.css">
</head>
<body>
	<div class="container_main container">
		<article>
			<section>
				<div class="row_1 boxcenter_1">
					<div class="left_1">
						<!-- Hiển thị bài viết chính (bài đầu tiên) -->
						<c:forEach var="news" items="${tgnewsList}" varStatus="status">
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
										<div class="text_postedDay_Author">
											<a href="">Ngày đăng: <fmt:formatDate
													value="${news.postedDate}" pattern="dd-MM-yyyy" /></a> / <a
												href="">Tác giả: ${news.author}</a>
										</div>
									</div>
								</div>
							</c:if>
						</c:forEach>

						<!-- Hiển thị các bài viết phụ -->
						<div class="row_1 duongke_1">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index >= 1 && status.index <= 3}">
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
						<a href="#"><img src="/Assignment_NVC/images/bannerthegioi.png"
							alt="" /></a>
					</div>
				</div>
			</section>
			<!-- section 2 -->
			<section>
				<div class="row_2 boxcenter_2">
					<div class="left_2">
						<c:forEach var="news" items="${tgnewsList}" varStatus="status">
							<c:if test="${status.index >= 4 && status.index <= 12}">
								<div class="title_2">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="lastnews_left_2">
									<div class="image_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"><img
											src="${pageContext.request.contextPath}/${news.image}"
											alt="${news.title}" /></a>
									</div>
									<div class="text_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</div>
								<hr />
							</c:if>
						</c:forEach>
						<c:forEach var="news" items="${tgnewsList}" varStatus="status">
							<c:if test="${status.index == 13}">
								<div class="title_2">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</div>
								<div class="lastnews_left_2">
									<div class="image_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"><img
											src="${pageContext.request.contextPath}/${news.image}"
											alt="${news.title}" /></a>
									</div>
									<div class="text_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</div>
								</div>
							</c:if>
						</c:forEach>
					</div>
					<!--  /// -->
					<div class="right_2">
						<div>
<!-- 							<b><a>Quân sự</a></b> -->
						</div>
						<div class="row_3">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 14}">
									<div class="col right_2_1">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											<img src="${pageContext.request.contextPath}/${news.image}"
											alt="${news.title}" />
										</a>
									</div>
									<div class="col right_2_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title} </a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}... </a>
										</p>
									</div>
								</c:if>
							</c:forEach>

							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 15}">
									<div class="col right_2_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title}</a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}...</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr />
						<div class="row_4">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index >= 16 && status.index <= 18}">
									<div class="col right_3_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr />
						<div>
<!-- 							<b><a>Phân tích</a></b> -->
						</div>
						<div class="row_3">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 19}">
									<div class="col right_2_1">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											<img src="${pageContext.request.contextPath}/${news.image}"
											alt="${news.title}" />
										</a>
									</div>
									<div class="col right_2_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title} </a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}... </a>
										</p>
									</div>
								</c:if>
							</c:forEach>

							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 20}">
									<div class="col right_2_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title}</a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}...</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr />
						<div class="row_4">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index >= 21 && status.index <= 23}">
									<div class="col right_3_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr />
						<div>
<!-- 							<b><a>Bầu cử tổng thống Mỹ</a></b> -->
						</div>
						<div class="row_3">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 24}">
									<div class="col right_2_1">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											<img src="${pageContext.request.contextPath}/${news.image}"
											alt="${news.title}" />
										</a>
									</div>
									<div class="col right_2_2">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title} </a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}... </a>
										</p>
									</div>
								</c:if>
							</c:forEach>

							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index == 25}">
									<div class="col right_2_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
											class="tax_link"> ${news.title}</a>
										<p class="tax-paragraph">
											<a
												href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
												${f:substring(news.content, 0, 100)}...</a>
										</p>
									</div>
								</c:if>
							</c:forEach>
						</div>
						<hr />
						<div class="row_4">
							<c:forEach var="news" items="${tgnewsList}" varStatus="status">
								<c:if test="${status.index >= 26 && status.index <= 28}">
									<div class="col right_3_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${news.title} </a>
									</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
				</div>
			</section>
		</article>
	</div>
</body>
</html>
