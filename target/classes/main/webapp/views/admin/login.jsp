<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/login.css">
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
    />
  </head>
  <body>
    <div class="login-container">
      <h3>Login</h3>
      <br />
        <!-- Hiển thị thông báo lỗi sau 3 lần nhập sai -->
      	<%
      		String lockoutMessage = (String) request.getAttribute("lockoutMessage");
      		if(lockoutMessage != null){	
      	%>
      		<div class="error-message">
      			<i class="fa fa-exclamation-circle"></i> <%= lockoutMessage %>
      		</div>
      		<%} else{ %>
      		<!-- Hiển thị thông báo lỗi chung nếu tên tài khoản hoặc mật khẩu không đúng -->
	     	<%
	     		String generalError = (String) request.getAttribute("generalError");
	     		if (generalError != null) {
	     	%>
	     		<div class="error-message"><%= generalError %></div>
	     		<% } %>
        	<% } %>
	     <form action="/Assignment_NVC/dangnhap" method="post">
	    <div class="input-group">
	        <i class="fa-solid fa-user"></i>
	        <input type="text" placeholder="Username" class="form-control" name="fullName" 
	               value="<%= request.getParameter("fullName") != null ? request.getParameter("fullName") : "" %>"/>
	        <!-- Hiển thị lỗi cho Username -->
	         <%
	            String usernameError = (String) request.getAttribute("usernameError");
	            if (usernameError != null) {
	        %>
	            <div class="error-message"><%= usernameError %></div>
	        <% } %>
	    </div>
	    <br />
	    <div class="input-group">
	        <i class="fa-solid fa-lock"></i>
	        <input type="password" placeholder="Password" class="form-control" name="password" />
	         <!-- Hiển thị lỗi cho Password -->
	        <%
	            String passwordError = (String) request.getAttribute("passwordError");
	            if (passwordError != null) {
	        %>
	            <div class="error-message"><%= passwordError %></div>
	        <% } %>
	    </div>
	    <br />
	    <div class="forgot-password"><a href="">Forget your password?</a></div>
	    <br />
	    <div>
	        <input type="submit" value="Login" class="form-control-login" />
	    </div>
	    <br />
	    <div class="create-account">
	        <a href="/Assignment_NVC/dangky">Create account!</a>
	    </div>
	    <br />
	    <div class="label-center"><label>Login with</label></div>
	    <br />
	    <div class="social-icons">
	        <a href="" class="social-link"> <i class="fa-brands fa-google"></i> Google</a>
	        <a href="" class="social-link"> <i class="fa-brands fa-facebook"></i> Facebook</a>
	        <a href="" class="social-link"> <i class="fa-brands fa-twitter"></i> Twitter</a>
	    </div>
		</form>
    </div>
    <!-- JavaScript để loại bỏ hoặc hiển thị lại thông báo lỗi khi người dùng nhập -->
    <script>
    	// Lấy tất cả các trường input
	    var inputs = document.querySelectorAll('input.form-control');
	
	    // Thêm sự kiện 'focus' để theo dõi khi người dùng nhấn vào ô nhập
	    inputs.forEach(function(input) {
	        input.addEventListener('focus', function() {
	            var errorElement = this.parentElement.querySelector('.error-message');
	            if (this.value.trim() === '' && errorElement) {
	                errorElement.style.display = 'block'; // Hiển thị thông báo lỗi khi ô nhập được chọn
	            }
	        });
	
	        // Thêm sự kiện 'input' để theo dõi khi người dùng nhập liệu
	        input.addEventListener('input', function() {
	            var errorElement = this.parentElement.querySelector('.error-message');
	            if (this.value.trim() !== '' && errorElement) {
	                errorElement.style.display = 'none'; // Ẩn thông báo lỗi nếu có dữ liệu
	            }
	        });
	    });
	</script>
  </body>
</html>
