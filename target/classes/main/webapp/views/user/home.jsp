<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/usersss.css">
</head>
<body>
	<!-- section 1 -->
	<section>
		<div class="row_1 boxcenter_1">
			<div class="left_1">
				<!-- Hiển thị bài viết chính (bài đầu tiên) -->
				<c:forEach var="news" items="${newslist}" varStatus="status">
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

				<!-- Hiển thị các bài viết phụ (bài thứ 2 và thứ 3) -->
				<div class="row_1 duongke_1">
					<c:forEach var="news" items="${newslist}" varStatus="status">
						<c:if test="${status.index > 0 && status.index < 3}">
							<div class="col_left lastnews_left_1_1">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a> <a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									<img src="${pageContext.request.contextPath}/${news.image}"
									alt="${news.title}" />
								</a>
							</div>
						</c:if>
					</c:forEach>

					<!-- Hiển thị phần Góc nhìn (bài thứ 4) -->
					<c:forEach var="news" items="${newslist}" varStatus="status">
						<c:if test="${status.index == 3}">
							<div class="col_left lastnews_left_1_1">
								<p class="chu_thich_1">
									<a href=""> Góc nhìn </a>
								</p>
								<p class="chu_thich_2">
									<a
										href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
										${news.title} </a>
								</p>
								<div>
									<p class="chu_thich_3">
										<a
											href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
											${f:substring(news.content, 0, 100)}... </a>
									</p>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<div class="col_right right_1">
				<a href="#"><img src="/Assignment_NVC/images/banner.jpg" alt="" /></a>
			</div>
		</div>
	</section>
	<!-- section 2 -->
	<section>
		<div class="row_2 boxcenter_2">
			<div class="left_2">
				<c:forEach var="news" items="${newslist}" varStatus="status">
					<c:if test="${status.index >= 4 && status.index <= 18}">
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
				<c:forEach var="news" items="${newslist}" varStatus="status">
					<c:if test="${status.index == 19}">
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
			<div class="right_2">
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Kinh doanh</a></li>
						<li><a href="">Quốc tế</a></li>
						<li><a href="">Doanh nghiệp</a></li>
						<li><a href="">Chứng khoán</a></li>
						<li><a href="">Vĩ mô</a></li>
						<li><a href=""> Hậu trường kinh doanh</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${kdnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${kdnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${kdnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Bất động sản</a></li>
						<li><a href="">Chính sách</a></li>
						<li><a href="">Thị trường</a></li>
						<li><a href="">Dự án</a></li>
						<li><a href="">Không gian sống</a></li>
						<li><a href="">Tư vấn</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${bdsnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${bdsnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${bdsnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Thể thao</a></li>
						<li><a href="">Euro 2024</a></li>
						<li><a href="">Bóng đá</a></li>
						<li><a href="">Tennis</a></li>
						<li><a href="">Marathon</a></li>
						<li><a href="">Lịch thi đấu</a></li>
						<li><a href="">V-league</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${ttnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${ttnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${ttnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
			
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Giải trí</a></li>
						<li><a href="">Giới sao</a></li>
						<li><a href="">Phim</a></li>
						<li><a href="">Nhạc</a></li>
						<li><a href="">Thời trang</a></li>
						<li><a href="">Sách</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${gtnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${gtnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${gtnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Sức khỏe</a></li>
						<li><a href="">Tin tức</a></li>
						<li><a href="">Dinh dưỡng</a></li>
						<li><a href="">Khỏe đẹp</a></li>
						<li><a href="">Các bệnh</a></li>
						<li><a href="">Vaccine</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${sknewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${sknewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${sknewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Đời sống</a></li>
						<li><a href="">Bài học sống</a></li>
						<li><a href="">Tổ ấm</a></li>
						<li><a href="">Tiêu dùng</a></li>
						<li><a href="">Cooking</a></li>
						<li><a href=""> Mua sắm thông minh</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${dsnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${dsnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${dsnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Giáo dục</a></li>
						<li><a href="">Tin tức</a></li>
						<li><a href="">Tuyển sinh</a></li>
						<li><a href="">Chân dung</a></li>
						<li><a href="">Du học</a></li>
						<li><a href="">Giáo dục 4.0</a></li>
						<li><a href="">Trắc nghiệm</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${gdnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${gdnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${gdnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
				<div>
					<ul class="n-menu">
						<li class="active"><a href="">Khoa học</a></li>
						<li><a href="">Việt Nam</a></li>
						<li><a href="">Chỉ số PII</a></li>
						<li><a href="">Phát minh</a></li>
						<li><a href="">Ứng dụng</a></li>
						<li><a href="">Thế giới tự nhiên</a></li>
					</ul>
				</div>
				<div class="row_3">
					<c:forEach var="news" items="${khnewsList}" varStatus="status">
						<c:if test="${status.index == 0}">
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
					
					<c:forEach var="news" items="${khnewsList}" varStatus="status">
						<c:if test="${status.index == 1}">
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
					<c:forEach var="news" items="${khnewsList}" varStatus="status">
						<c:if test="${status.index >= 2 && status.index <= 4}">
							<div class="col right_3_${status.index - 1}">
								<a
									href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
									${news.title} </a>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<hr />
			</div>
		</div>
	</section>
	<!-- section 3 -->
	<section>
		<div class="row_1 boxcenter_1">
			<ul class="n_menu_1">
				<li class="active"><a href="">Podcasts</a></li>
				<li><a href="">VnExpress hôm nay</a></li>
				<li><a href="">Tâm điểm kinh tế</a></li>
				<li><a href="">Tài chính cá nhân</a></li>
				<li><a href="">Giải mã</a></li>
				<li><a href="">Hộp đen</a></li>
				<li><a href="">Thầm thì</a></li>
			</ul>
		</div>
		<div class="row_1 boxcenter_1 duongke_2">
			<div class="row_6 khoangcach_1">
				<div class="col_1 image_6_1">
					<a href="#"><img src="/Assignment_NVC/image/a26.jpg" alt="" /></a>
				</div>
				<div class="col_2 text_6_2">
					<a href="#" class="tax_link_6">Công nhân chọn thất nghiệp, nhà
						máy 'khát' người</a>
					<p class="tax-paragraph_6">
						<a href="#">"Cắm mặt" vào xưởng gỗ 15 năm nhưng lương không
							cải thiện, doanh nghiệp "thích thì sa thải", bất an vì luật BHXH
							thay đổi, anh Phạm Đại, từ chối hàng chục lời mời từ nhà máy để
							bưng bê thời vụ. </a>
					</p>
				</div>
				<div class="col_1 image_6_3">
					<a href="#"><img src="/Assignment_NVC/image/a27.jpg" alt="" /></a>
				</div>
				<div class="col_2 text_6_4">
					<a href="#" class="tax_link_6">Điểm tin 17h: Đề xuất đánh thuế
						giao dịch vàng; Máy bay quân sự Ukraine 'lần đầu tập kích lãnh thổ
						Nga'</a>
					<p class="tax-paragraph_6">
						<a href="#">Ông Ngô Xuân Thắng làm Chủ tịch HĐND TP Đà Nẵng;
							Pháp giải tán quốc hội, tổ chức bầu cử sớm để chặn phe cực... </a>
					</p>
				</div>
			</div>
		</div>
		<div class="row_1 boxcenter_1 duongke_2">
			<div class="row_6 khoangcach_2">
				<div class="col_3 text_7_1">
					<i class="fa-solid fa-headphones"></i> <a href="#"
						class="tax_link_6">Công nhân chọn thất nghiệp, nhà máy 'khát'
						người</a>
					<p class="tax-paragraph_6">
						<a href="#">"Cắm mặt" vào xưởng gỗ 15 năm nhưng lương không
							cải thiện, doanh nghiệp "thích thì sa thải", bất an vì luật BHXH
							thay đổi, anh Phạm Đại, từ chối hàng chục lời mời từ nhà máy để
							bưng bê thời vụ. </a>
					</p>
				</div>
				<div class="col_3 text_7_2">
					<i class="fa-solid fa-headphones"></i> <a href="#"
						class="tax_link_6">Công nhân chọn thất nghiệp, nhà máy 'khát'
						người</a>
					<p class="tax-paragraph_6">
						<a href="#">"Cắm mặt" vào xưởng gỗ 15 năm nhưng lương không
							cải thiện, doanh nghiệp "thích thì sa thải", bất an vì luật BHXH
							thay đổi, anh Phạm Đại, từ chối hàng chục lời mời từ nhà máy để
							bưng bê thời vụ. </a>
					</p>
				</div>
				<div class="col_3 text_7_3">
					<i class="fa-solid fa-headphones"></i> <a href="#"
						class="tax_link_6">Công nhân chọn thất nghiệp, nhà máy 'khát'
						người</a>
					<p class="tax-paragraph_6">
						<a href="#">"Cắm mặt" vào xưởng gỗ 15 năm nhưng lương không
							cải thiện, doanh nghiệp "thích thì sa thải", bất an vì luật BHXH
							thay đổi, anh Phạm Đại, từ chối hàng chục lời mời từ nhà máy để
							bưng bê thời vụ. </a>
					</p>
				</div>
			</div>
		</div>
	</section>
	<!-- section 4 -->
	<section>
		<div class="row_1 boxcenter_1 khoangcach_2">
			<div class="left_3">
				<div>
					<ul class="n_menu_1">
						<li class="active"><a href="">Du lịch</a></li>
						<li><a href="">Điểm đến</a></li>
						<li><a href="">Ẩm thực</a></li>
						<li><a href="">Dấu chân</a></li>
						<li><a href="">Tư vấn </a></li>
						<li><a href="">Cẩm nang</a></li>
						<li><a href="">Ảnh</a></li>
					</ul>
				</div>
				<div class="lastnews_3">
					<a href="#"><img src="/Assignment_NVC/image/a28.jpg" alt="" /></a>
					<a href="#">Mắc kẹt, đổi lịch trình tour vì mưa lũ ở Hà Giang</a>
					<p class="tax-paragraph_6">Mưa lớn gây ngập lụt, sạt lở cục bộ
						khiến lịch trình du lịch Hà Giang của du khách phải thay đổi để
						đảm bảo an toàn.</p>
				</div>
			</div>
			<div class="center_3">
				<div class="lastnews_3">
					<a href="#"><img src="/Assignment_NVC/image/a29.jpg" alt="" /></a>
					<a href="#">Vì sao Việt Nam tụt hạng tỉ số cạnh tranh du lịch?</a>
				</div>
				<hr />
				<div class="lastnews_3">
					<a href="#"><img src="/Assignment_NVC/image/a30.png" alt="" /></a>
					<a href="#">Lễ vía Bà Đen lập kỷ lục có số đèn đăng nhiều nhất
						Việt Nam</a>
				</div>
			</div>
			<div class="right_3">
				<div class="lastnews_right_3">
					<div class="text_nd">
						<a href="#">Ba ngôi chùa cổ 600 tuổi trên vách núi </a>
					</div>
					<div class="image_nd">
						<a href="#"><img src="/Assignment_NVC/image/a30.jpg" alt="" /></a>
					</div>
				</div>
				<hr />
				<div class="lastnews_right_3">
					<div class="text_nd">
						<a href="#">Dân đảo du lịch ở Tây Ban Nha biểu tình đuổi khách</a>
					</div>
					<div class="image_nd">
						<a href="#"><img src="/Assignment_NVC/image/a31.jpg" alt="" /></a>
					</div>
				</div>
				<hr />
				<div class="lastnews_right_3">
					<div class="text_nd">
						<a href="#">1.100 drone 'vẽ' ánh sáng trên trời đêm TP HCM </a>
					</div>
					<div class="image_nd">
						<a href="#"><img src="/Assignment_NVC/image/a32.jpg" alt="" /></a>
					</div>
				</div>
				<hr />
				<div class="lastnews_right_3">
					<div class="text_nd">
						<a href="#">Khóa học giao tiếp hiệu quả cùng MC Đức Bảo giảm
							còn 99.000 đồng </a>
					</div>
					<div class="image_nd">
						<a href="#"><img src="/Assignment_NVC/image/a33.png" alt="" /></a>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>