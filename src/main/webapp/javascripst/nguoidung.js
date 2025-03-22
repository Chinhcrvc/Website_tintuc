function validateForm() {
    var form = document.forms["userForm"]; // Đổi tên thành userForm nếu tên biểu mẫu khác
    // Lấy giá trị các trường từ biểu mẫu
    var id = form["id"].value.trim();
    var password = form["password"].value.trim();
    var fullName = form["fullName"].value.trim();
    var birthDay = form["birthDay"].value;
    var gender = form["gender"].value;
    var mobile = form["moble"].value.trim();
    var email = form["email"].value.trim();
    var role = form["role"].value;

    // Kiểm tra mã người dùng
    var idPattern = /^[a-zA-Z0-9]+$/;
    if (id === "") {
        alert("Mã người dùng không được để trống.");
        return false;
    } else if (id.length < 2) {
        alert("Mã người dùng phải có ít nhất 2 ký tự.");
        return false;
    } else if (!idPattern.test(id)) {
        alert("Mã người dùng không được chứa ký tự đặc biệt.");
        return false;
    }

    // Kiểm tra mật khẩu
    if (password === "") {
        alert("Mật khẩu không được để trống.");
        return false;
    } else if (password.length < 6) {
        alert("Mật khẩu phải có ít nhất 6 ký tự.");
        return false;
    }

    // Kiểm tra họ và tên
    if (fullName === "") {
        alert("Họ và tên không được để trống.");
        return false;
    } else if (fullName.length < 2) {
        alert("Họ và tên phải có ít nhất 2 ký tự.");
        return false;
    } else if (/[\d]/.test(fullName)) { // Kiểm tra xem có số trong họ và tên
        alert("Họ và tên không được chứa số.");
        return false;
    } else if (/[^a-zA-ZÀ-ỹ\s]/.test(fullName)) { // Kiểm tra ký tự đặc biệt
        alert("Họ và tên không được chứa ký tự đặc biệt.");
        return false;
    }

    // Kiểm tra ngày sinh
    if (birthDay === "") {
        alert("Ngày sinh không được để trống.");
        return false;
    }

    // Kiểm tra giới tính
    if (gender === "") {
        alert("Giới tính phải được chọn.");
        return false;
    }

    // Kiểm tra điện thoại
    if (mobile === "") {
        alert("Điện thoại không được để trống.");
        return false;
    } else if (!/^\d+$/.test(mobile)) {
        alert("Điện thoại chỉ được chứa số.");
        return false;
    }

    // Kiểm tra email
    if (email === "") {
        alert("Email không được để trống.");
        return false;
    } else if (!/\S+@\S+\.\S+/.test(email)) {
        alert("Email không hợp lệ.");
        return false;
    }

    // Kiểm tra vai trò
    if (role === "") {
        alert("Vai trò phải được chọn.");
        return false;
    }
    
    return true; // Trả về true nếu tất cả các trường hợp hợp lệ
}
