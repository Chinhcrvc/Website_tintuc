<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/usersss.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>
<body>
	<div class="container">
		<nav>
			<div>
				<ul class="n_menu">
					<li><a href="/Assignment_NVC/users/trangchu"><i class="fa-solid fa-house"></i></a></li>
					<li><a href="">Thời sự</a>
						<ul class="sub_menu">
							<li><a href="">Chính trị</a></li>
							<li><a href="">Lao động - Việc làm</a></li>
							<li><a href="">Giao thông</a></li>
							<li><a href="">Mekong</a></li>
							<li><a href="">Qũy Hy vọng</a></li>
						</ul>
					</li>
					<!-- <li><a href="">Góc nhìn</a>
						<ul class="sub_menu">
							<li><a href="">Bình luận nhiều</a></li>
							<li><a href="">Chính trị & chính sách</a></li>
							<li><a href="">Y tế & sức khỏe</a></li>
							<li><a href="">Kinh doanh & và quản trị</a></li>
							<li><a href="">Giáo dục & tri thức</a></li>
							<li><a href="">Môi trường</a></li>
							<li><a href="">Văn hóa & lối sống</a></li>
							<li><a href="">Covid 19</a></li>
							<li><a href="">Tác giả</a></li>
						</ul>
					</li> -->
					<li><a href="/Assignment_NVC/users/thegioi">Thế giới</a>
						<ul class="sub_menu">
							<li><a href="">Tư liệu</a></li>
							<li><a href="">Phân tích</a></li>
							<li><a href="">Người Việt 5 châu</a></li>
							<li><a href="">Cuộc sống đó đây</a></li>
							<li><a href="">Quân sự</a></li>
						</ul>
					</li>
					<!-- <li><a href="">Video</a>
						<ul class="sub_menu">
							<li><a href="">Thời sự</a></li>
							<li><a href="">Nhịp sống</a></li>
							<li><a href="">Food</a></li>
							<li><a href="">Pháp luật</a></li>
							<li><a href="">Giải trí</a></li>
							<li><a href="">Thế giới</a></li>
							<li><a href="">Khoa học</a></li>
							<li><a href="">Thể thao</a></li>
							<li><a href="">Giáo dục</a></li>
							<li><a href="">Xe</a></li>
							<li><a href="">Số hóa</a></li>
							<li><a href="">Du lịch</a></li>
							<li><a href="">Sức khỏe</a></li>
							<li><a href="">Chủ đề</a></li>
						</ul>
					</li> -->
					<li><a href="">Podcasts</a>
						<ul class="sub_menu">
							<li><a href="">VnExpress hôm nay</a></li>
							<li><a href="">Tâm điểm kinh tế</a></li>
							<li><a href="">Tài chính cá nhân</a></li>
							<li><a href="">Giải mã</a></li>
							<li><a href="">Hộp đen</a></li>
						</ul>
					</li>
					<li><a href="/Assignment_NVC/users/kinhdoanh">Kinh doanh</a>
						<ul class="sub_menu">
							<li><a href="">Doanh nghiệp</a></li>
							<li><a href="">Chứng khoán</a></li>
							<li><a href="">Ebank</a></li>
							<li><a href="">Vĩ mô</a></li>
							<li><a href="">Bảo hiểm</a></li>
						</ul>
					</li>
					<li><a href="" target="main">Bất động sản</a>
						<ul class="sub_menu">
							<li><a href="">Chính sách</a></li>
							<li><a href="">Thị trường</a></li>
							<li><a href="">Dự án</a></li>
							<li><a href="">Không gian sống</a></li>
							<li><a href="">Tư vấn</a></li>
						</ul>
					</li>
					<li><a href="/Assignment_NVC/users/khoahoc" >Khoa học</a>
						<ul class="sub_menu">
							<li><a href="">Khoa học trong nước</a></li>
							<li><a href="">Chỉ số PII</a></li>
							<li><a href="">Tin tức</a></li>
							<li><a href="">Phát minh</a></li>
							<li><a href="">Ứng dụng</a></li>
						</ul>
					</li>
					<li><a href="">Giải trí</a>
						<ul class="sub_menu">
							<li><a href="">Sách</a></li>
							<li><a href="">Video</a></li>
							<li><a href="">Phim</a></li>
							<li><a href="">Nhạc</a></li>
							<li><a href="">Thời trang</a></li>
						</ul>
					</li>
					<li><a href="/Assignment_NVC/users/thethao">Thể thao</a>
						<ul class="sub_menu">
							<li><a href="">Euro 2024</a></li>
							<li><a href="">Bóng đá</a></li>
							<li><a href="">Lịch thi đấu</a></li>
							<li><a href="">Marathon</a></li>
							<li><a href="">Tennis</a></li>
						</ul>
					</li>
					<li><a href="/Assignment_NVC/users/phapluat">Pháp luật</a>
						<ul class="sub_menu">
							<li><a href="">Hồ sơ phá án</a></li>
							<li><a href="">Tư vấn</a></li>
							<li><a href="">Video</a></li>
						</ul>
					</li>
					<li><a href="" >Giáo dục</a>
						<ul class="sub_menu">
							<li><a href="">Tin tức</a></li>
							<li><a href="">Tuyển sinh</a></li>
							<li><a href="">Chân dung</a></li>
							<li><a href="">Du học</a></li>
							<li><a href="">Thảo luận</a></li>
						</ul>
					</li>
					<li><a href="" >Sức khỏe</a>
						<ul class="sub_menu">
							<li><a href="" target="main">Tin tức</a></li>
							<li><a href="">Tư vấn</a></li>
							<li><a href="">Dinh dưỡng</a></li>
							<li><a href="">Khỏe đẹp</a></li>
							<li><a href="">Đàn ông</a></li>
						</ul>
					</li>
					<li><a href="" >Đời sống</a>
						<ul class="sub_menu">
							<li><a href="">Nhịp sống</a></li>
							<li><a href="">Tổ ấm</a></li>
							<li><a href="">Bài học sống</a></li>
							<li><a href="">Cooking</a></li>
							<li><a href="">Tiêu dùng</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>