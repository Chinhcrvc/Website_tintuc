package crud.servlets.user;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crud.DAO.UsersDAO;
import crud.entities.Users;

@WebServlet({ "/dangnhap", "/dangky" })
public class Account_Servlet extends HttpServlet {
	UsersDAO usersDAO = new UsersDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if (uri.contains("dangnhap")) {
			req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
		} else if (uri.contains("dangky")) {
			req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if (uri.contains("dangnhap")) {
			String username = req.getParameter("fullName");
			String password = req.getParameter("password");
			boolean hasError = false;

			HttpSession session = req.getSession();
			Integer failedAttempts = (Integer) session.getAttribute("failedAttempts");
			if (failedAttempts == null) {
				failedAttempts = 0;
			}

			// Kiểm tra trường nhập liệu
			if (username == null || username.isEmpty()) {
				req.setAttribute("usernameError", "Vui lòng điền vào mục này.");
				hasError = true;
			}
			if (password == null || password.isEmpty()) {
				req.setAttribute("passwordError", "Vui lòng điền vào mục này.");
				hasError = true;
			}

			// Nếu có lỗi, hiển thị lại form đăng nhập
			if (hasError) {
				req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
				return;
			}

			// Kiểm tra username và password trong cơ sở dữ liệu
			Users user = usersDAO.selectById(username);
			if (user == null || !user.getPassword().equals(password)) {
				failedAttempts++;
				session.setAttribute("failedAttempts", failedAttempts);
				if (failedAttempts >= 3) {
					req.setAttribute("lockoutMessage",
							"Tài khoản hoặc mật khẩu không chính xác. Vui lòng nhấn 'Quên?' để đặt lại mật khẩu mới.");
				} else {
					req.setAttribute("generalError", "Tên tài khoản hoặc mật khẩu không đúng, vui lòng thử lại.");
				}
				

				req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
			} else {
				session.setAttribute("failedAttempts", 0);
				session.setAttribute("currentUser", user);
				session.setAttribute("username", user.getFullName());
				resp.sendRedirect("/Assignment_NVC/tintuc/index");
			}
		} else if (uri.contains("dangky")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			String fullname = req.getParameter("fullName");
			String birthdayStr = req.getParameter("birthDay"); 
			String mobile = req.getParameter("mobile");
			String email = req.getParameter("email");
			String gender = req.getParameter("gender"); 
			String role = req.getParameter("role");

			boolean hasError = false;
			// Chuyển đổi birthday từ String sang java.util.Date
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date utilBirthday = null;
			java.sql.Date birthday = null;
			try {
				utilBirthday = dateFormat.parse(birthdayStr); // Phân tích thành java.util.Date
				birthday = new java.sql.Date(utilBirthday.getTime()); // Chuyển đổi sang java.sql.Date
			} catch (ParseException e) {
				req.setAttribute("birthdayError",
						"Định dạng ngày sinh không hợp lệ. Vui lòng sử dụng định dạng yyyy-MM-dd.");
				hasError = true;
			}

			// Nếu có lỗi, trả về trang đăng ký
			if (hasError) {
				req.getRequestDispatcher("/views/user/register.jsp").forward(req, resp);
				return;
			}

			// Tạo đối tượng User và lưu vào database
			Users user = new Users(id, password, fullname, birthday, "Nam".equals(gender), mobile, email, "Admin".equals(role));
			usersDAO.insert(user); // Lưu vào database thông qua DAO

			// Đăng ký thành công, chuyển hướng đến trang danh sách người dùng
			resp.sendRedirect(req.getContextPath() + "/nguoidung/index");
		}
	}
}
