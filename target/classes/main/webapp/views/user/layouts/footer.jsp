<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="/Assignment_NVC/css/usersss.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
	<style type="text/css">
	
	.subscription-form {
    max-width: 500px;
    margin: 20px auto; 
    padding: 15px; 
    border: 1px solid #ddd; 
    border-radius: 5px; 
    background-color: #f9f9f9; 
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); 
}

.input-group {
    display: flex; 
}

.form-controll {
    flex: 1; 
    padding: 10px; 
    border: 1px solid #ccc;
    border-radius: 5px; 
    transition: border-color 0.3s;
}

.form-controll:focus {
    border-color: #007bff; 
    outline: none; 
}

.btn-primary {
    margin-left: 10px; 
    padding: 10px 15px;
    border-radius: 5px; 
    transition: background-color 0.3s; 
}

.btn-primary:hover {
    background-color: #0056b3;
}
	</style>
</head>
<body>
	<footer>
		<div class="footer_main boxcenter_footer">
			<div class="col_footer">
				<p>
					<strong>Báo tiếng Việt nhiều người xem nhất</strong>
				</p>
				<p>Thuộc Bộ Khoa học và Công nghệ</p>
				<p>Số giấy phép: 548/GP-BTTTT ngày 24/08/2021</p>
			</div>

			<div class="col_footer">
				<p>Tổng biên tập: Phạm Văn Hiếu</p>
				<p>Địa chỉ: Tầng 10, Tòa A FPT Tower</p>
				<p>Số 10 Phạm Văn Bạch, Dịch Vọng, Cầu Giấy, Hà Nội</p>
				<p>Điện thoại: 024 7300 8899 - máy lẻ 4500</p>
			</div>
			<div class="col_footer">
				<p>© 1997-2024. Toàn bộ bản quyền thuộc VnExpress</p>
				<h2 class="pb-2">Đăng ký nhận tin</h2>
				<form action="${pageContext.request.contextPath}/users/email" 
					method="post">
					<div class="input-group w-100">
						<input type="email" class="form-controll" name="email"
							placeholder="Email của bạn ..." required>
						<button class="btn btn-primary" type="submit">Đăng ký</button>
					</div>
				</form>
			</div>
		</div>
	</footer>
</body>
</html>