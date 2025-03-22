function validateForm() {
    var id = document.forms["registerForm"]["id"].value;
    var password = document.forms["registerForm"]["password"].value;
    var confirmPassword = document.forms["registerForm"]["confirmPassword"].value;
    var fullName = document.forms["registerForm"]["fullName"].value;
    var birthDay = document.forms["registerForm"]["birthDay"].value;
    var mobile = document.forms["registerForm"]["mobile"].value;
    var email = document.forms["registerForm"]["email"].value;
    var gender = document.forms["registerForm"]["gender"].value;
    var role = document.forms["registerForm"]["role"].value;

    if (id === "" || password === "" || confirmPassword === "" || fullName === "" || birthDay === "" || mobile === "" || email === "" || !gender || !role) {
        alert("Vui lòng điền tất cả các trường bắt buộc.");
        return false;
    }

    if (password !== confirmPassword) {
        alert("Mật khẩu và xác nhận mật khẩu không khớp.");
        return false;
    }

    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailPattern.test(email)) {
        alert("Email không hợp lệ.");
        return false;
    }

    if (isNaN(mobile) || mobile.length < 10) {
        alert("Số điện thoại không hợp lệ.");
        return false;
    }

    return true;
}

