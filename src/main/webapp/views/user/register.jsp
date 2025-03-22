<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng Ký</title>
    <link rel="stylesheet" type="text/css" href="/Assignment_NVC/css/registeres.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
</head>
<body>
    <div class="register-container">
        <h3>Đăng Ký</h3>
        <form name="registerForm" action="/Assignment_NVC/dangky" method="post" onsubmit="return validateForm()"> 
            <div class="input-group">
                <i class="fa-solid fa-id-card"></i>
                <input type="text" name="id" placeholder="ID" class="form-control" required />
            </div>
            <br />
            <div class="input-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="password" placeholder="Mật khẩu" class="form-control" required />
            </div>
            <br />
            <div class="input-group">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" class="form-control" required />
            </div>
            <br />
            <div class="input-group">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="fullName" placeholder="Tên đăng nhập" class="form-control" required />
            </div>
            <br />
            <div class="input-group">
                <i class="fa-solid fa-calendar"></i>
                <input type="date" name="birthDay" class="form-control" required />
            </div>
            <br />
            <div class="input-group">
                <i class="fa-solid fa-phone"></i>
                <input type="text" name="mobile" placeholder="Điện thoại" class="form-control" required />
            </div>
            <br />
             <div class="input-group">
                <i class="fa-sharp fa-regular fa-envelope"></i>
                <input type="email" name="email" placeholder="Email" class="form-control" required />
            </div>
            <br />
            <label>Giới tính:</label>
            <div class="radio-group">
                <label>
                    <input type="radio" name="gender" value="Nam" required /> Nam
                </label>
                <label>
                    <input type="radio" name="gender" value="Nữ" required /> Nữ
                </label>
            </div>
            <br />
            <label>Vai trò:</label>
            <div class="radio-group">
                <label>
                    <input type="radio" name="role" value="User" required /> Người dùng
                </label>
            </div>
            <br />
            <div class="accept">
                <input type="checkbox" name="terms" required /> Accept all terms!
            </div>
            <br />
            <div>
                <input type="submit" value="Đăng Ký" class="form-control-register" />
            </div>
            <br />
            <div>
                <label class="label">Already have an account! <a href="/Assignment_NVC/dangnhap">Login</a></label>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="/Assignment_NVC/javascripst/dangky.js"></script>
</body>
</html>
