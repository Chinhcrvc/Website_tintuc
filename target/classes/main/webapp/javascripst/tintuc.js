function validateForm() {
	var form = document.forms["newsForm"];
	// Lấy giá trị các trường từ biểu mẫu
	var id = form["id"].value.trim();
	var title = form["title"].value.trim();
	var content = form["content"].value.trim();
	/*var postedDate = form["postedDate"].value;*/
	var author = form["author"].value.trim();
	/*var viewCount = form["viewCount"].value.trim();*/
	/*var image = form["image"].value;*/
	var home = form["home"].value;

	// Kiểm tra mã tin tức
	var idPattern = /^[a-zA-Z0-9]+$/;
	if (!form["id"].hasAttribute("readonly")) {
		// Nếu không có readonly, tức là đang thêm mới
		if (id === "") {
			alert("Mã tin tức không được để trống");
			return false;
		} else if (id.length < 2) {
			alert("Mã tin tức phải có ít nhất 2 ký tự.");
			return false;
		} else if (!idPattern.test(id)) {
			alert("Mã tin tức không được chứa ký tự đặc biệt.");
			return false;
		}
	}

	// Kiểm tra tiêu đề
	if (title === "") {
		alert("Tiêu đề không được để trống");
		return false;
	} else if (title.length < 5) {
		alert("Tiêu đề phải có ít nhất 5 ký tự.");
		return false;
	}

	// Kiểm tra nội dung
	if (content === "") {
		alert("Nội dung không được để trống.");
		return false;
	} else if (content.length < 10) {
		alert("Nội dung phải có ít nhất 10 ký tự.");
		return false;
	}

	// Kiểm tra tác giả 
	var authorPattern = /^[a-zA-ZÀ-ỹ\s]+$/; // Tác giả chỉ được chứa ký tự chữ và khoảng trắng
	if (author === "") {
		alert("Tác giả không được để trống.");
		return false;
	} else if (!authorPattern.test(author)) {
		alert("Tác giả không được chứa số hoặc ký tự đặc biệt.");
		return false;
	}

	/*// Kiểm tra số lượt xem
	if (viewCount === "") {
		alert("Số lượt xem không được để trống.");
		return false;
	} else if (isNaN(viewCount)) {
		alert("Số lượt xem phải là một số.");
		return false;
	} else if (parseInt(viewCount) < 0) {
		alert("Số lượt xem không được nhỏ hơn 0.");
		return false;
	}*/

	// Kiểm tra loại tin tức (categoryId)
	if (form["categoryId"].value === "") {
		alert("Bạn phải chọn loại tin tức.");
		return false;
	}

	// Kiểm tra trạng thái home
	if (home !== "true" && home !== "false") {
		alert("Trạng thái 'Home' phải được chọn.");
		return false;
	}
	return true; // Trả về true nếu tất cả các trường hợp hợp lệ
}