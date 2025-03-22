<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${news.title}</title>
    <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/usersss.css">
</head>
<body>
    <div class="chitiet_container">
        <!-- Bài viết chi tiết -->
        <article>
            <section>
                <div class="trangchitiet">
                    <h1 class="tieude_chitiet">${news.title}</h1>
                    <div class="image_chitiet">
                        <img src="${pageContext.request.contextPath}/${news.image}" alt="" />
                    </div>
                    <div class="text_chitiet">
                        <p>${news.content}</p>
                    </div>
                    <div class="Author_Date_chitiet">
                        <p>Ngày đăng: <fmt:formatDate value="${news.postedDate}" pattern="dd/MM/yyyy" /> / Tác giả: ${news.author}</p>
                        <p>Lượt xem: ${news.viewCount}</p>
                    </div>
                </div>
            </section>
        </article>

        <!-- Tin tức liên quan -->
        <aside class="related-news">
            <h2>Tin tức liên quan</h2>
            <c:forEach var="item" items="${relatedNews}">
                <div class="related-item">
                    <h3><a href="${pageContext.request.contextPath}/chitiet/asm?id=${item.id}">${item.title}</a></h3>
                </div>
            </c:forEach>
        </aside>
    </div>
</body>
</html>
