package crud.servlets.admin;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.DateConverter;

import crud.DAO.UsersDAO;
import crud.entities.Users;

@WebServlet({"/nguoidung/index", "/nguoidung/create", "/nguoidung/update/*", "/nguoidung/delete"})
public class USERS_Servlet extends HttpServlet{
	UsersDAO dao = new UsersDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8"); // Đặt mã hóa cho phản hồi
		req.setCharacterEncoding("UTF-8"); // Đặt mã hóa cho yêu cầu
		String uri = req.getRequestURI();
		if (uri.contains("index")) {
			List<Users> nguoidungList = dao.selectAll();
			req.setAttribute("view", "/views/admin/nguoidung/index.jsp");
			req.setAttribute("users", nguoidungList);
		} else if (uri.contains("create")) {
			req.setAttribute("view", "/views/admin/nguoidung/create.jsp");
		} else if (uri.contains("update")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
			Users user = dao.selectById(id);
			if (user != null) {
				req.setAttribute("user", user); // Đổ dữ liệu người dùng lên form
				req.setAttribute("view", "/views/admin/nguoidung/update.jsp");
			}
			else {
	            resp.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
	        }
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		req.getRequestDispatcher("/views/admin/layout.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8"); // Đặt mã hóa cho phản hồi
		req.setCharacterEncoding("UTF-8"); // Đặt mã hóa cho yêu cầu
		String uri = req.getRequestURI();
		if(uri.contains("create")) {
			Users users = new Users();
			// Thiết lập DateConverter để chuyển đổi từ String sang Date
			DateConverter converter = new DateConverter(null); // null là giá trị mặc định nếu chuỗi không hợp lệ
			converter.setPattern("yyyy-MM-dd");
			ConvertUtils.register(converter, Date.class);
			try {
				BeanUtils.populate(users, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
				System.out.println("Erorr: " + e);
			}
			dao.insert(users);
			req.getSession().setAttribute("message", "Thêm mới thành công!");
			resp.sendRedirect("/Assignment_NVC/nguoidung/index");
		}else if (uri.contains("update")) {
			Users users = new Users();
			DateConverter converter = new DateConverter(null);
			converter.setPattern("yyyy-MM-dd");
			ConvertUtils.register(converter, Date.class);
			try {
				BeanUtils.populate(users, req.getParameterMap());
			} catch (IllegalAccessException | InvocationTargetException e) {
				e.printStackTrace();
			}
			dao.update(users);
			req.getSession().setAttribute("message", "Cập nhật thành công!");
			resp.sendRedirect("/Assignment_NVC/nguoidung/index");
		}else if (uri.contains("delete")) {
			String manguoidung = req.getParameter("id");
			dao.delete(manguoidung);
			req.getSession().setAttribute("message", "Xóa thành công!");
			resp.sendRedirect("/Assignment_NVC/nguoidung/index");
		}
	}
}
