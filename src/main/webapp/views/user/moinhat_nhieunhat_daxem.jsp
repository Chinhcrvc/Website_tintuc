<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="f"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Nhiều nhất_Mới nhất_Đã xem</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/useres.css" />
</head>
<body>
	<div class="tonghop">
		<div class="new_moinhat">
			<div class="title_moinhat">
				<b>Bản tin mới nhất</b>
			</div>
			<c:forEach var="news" items="${recentNewsList}">
				<div class="lastnews_moinhat">
					<div class="image_moinhat">
						<a
							href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
							<img src="${pageContext.request.contextPath}/${news.image}"
							alt="" />
						</a>
					</div>
					<div class="text_moinhat">
						<a
							href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
							${news.title} </a>
						<div class="text_content">
							<a
								href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
								${f:substring(news.content, 0, 100)}... </a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="news_nhieunhat">
			<div class="col_right right_1">
				<a href="#"><img src="/Assignment_NVC/image/bannermoinhat.png" alt="" /></a>
			</div>
			<div class="title_nhieunhat">
				<b>Bản tin xem nhiều nhất</b>
			</div>
			<c:forEach var="news" items="${top5MostViewedNews}">
				<div class="lastnews_nhieunhat">
					<%-- <div class="image_nhieunhat">
						<a
							href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
							<img src="${pageContext.request.contextPath}/${news.image}"
							alt="" />
						</a>
					</div> --%>
					<div class="text_nhieunhat">
						<a
							href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}">
							${news.title} </a>
					</div>
				</div>
				<hr>
			</c:forEach>
		</div>
		<%-- <div class="news_daxem">
            <div class="title_2">
              <b>5 bản tin đã xem</b>
            </div>
            <c:forEach var="news" items="${mostViewedNewsList}">
              <div class="lastnews_left_2">
                <div class="image_2">
                  <a
                    href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
                  >
                    <img
                      src="${pageContext.request.contextPath}/${news.image}"
                      alt=""
                    />
                  </a>
                </div>
                <div class="text_2">
                  <a
                    href="${pageContext.request.contextPath}/chitiet/asm?id=${news.id}"
                  >
                    ${news.title}
                  </a>
                </div>
              </div>
            </c:forEach>
          </div> --%>
	</div>
</body>
</html>
