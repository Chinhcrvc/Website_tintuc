function validateForm() {
	var form = document.forms["categoryForm"];
	var id = form["id"].value.trim();
	var name = form["name"].value.trim();

	// Kiểm tra mã tin tức
	var idPattern = /^[a-zA-Z0-9]+$/;
	if (!form["id"].hasAttribute("readonly")) {
		// Nếu không có readonly, tức là đang thêm mới
		if (id === "") {
			alert("Mã loại tin không được để trống");
			return false;
		} else if (id.length < 2) {
			alert("Mã loại tin phải có ít nhất 2 ký tự.");
			return false;
		} else if (!idPattern.test(id)) {
			alert("Mã loại tin không được chứa ký tự đặc biệt.");
			return false;
		}
	}

	// Kiểm tra tên loại tin không được để trống
	if (name === "") {
		alert("Tên loại tin không được để trống.");
		return false;
	}

	// Kiểm tra tên loại tin không chứa số hoặc ký tự đặc biệt
	var namePattern = /^[a-zA-ZÀ-ỹ\s]+$/;
	if (!namePattern.test(name)) {
		alert("Tên loại tin không được chứa số hoặc ký tự đặc biệt.");
		return false;
	}
	return true; // Trả về true nếu tất cả các trường hợp hợp lệ
}
