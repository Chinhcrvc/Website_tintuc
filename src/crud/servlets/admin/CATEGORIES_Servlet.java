package crud.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.DAO.CategoriesDAO;
import crud.entities.Categories;

@WebServlet({"/loaitin/index", "/loaitin/create", "/loaitin/update/*", "/loaitin/delete"})
public class CATEGORIES_Servlet extends HttpServlet {
	CategoriesDAO dao = new CategoriesDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8"); // Đặt mã hóa cho phản hồi
		req.setCharacterEncoding("UTF-8"); // Đặt mã hóa cho yêu cầu
		String uri = req.getRequestURI();
		if (uri.contains("index")) {
			List<Categories> loaitinList = dao.selectAll();
			req.setAttribute("categories", loaitinList);
			req.setAttribute("view", "/views/admin/loaitin/index.jsp");
		} else if (uri.contains("create")) {
			req.setAttribute("view", "/views/admin/loaitin/create.jsp");
		} else if (uri.contains("update")) {
			String maloaitin = uri.substring(uri.lastIndexOf("/") + 1);
			Categories category = dao.selectById(maloaitin);
			req.setAttribute("category", category);
			req.setAttribute("view", "/views/admin/loaitin/update.jsp");
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
			String maloaitin = req.getParameter("id");
			String tenloaitin = req.getParameter("name");
			
			 Categories existingCategory = dao.selectById(maloaitin);
		        if (existingCategory != null) {
		            // Lưu thông báo lỗi vào session
		            req.getSession().setAttribute("errorMessage", "Mã loại tin đã tồn tại!");
		            // Cung cấp thông tin đã nhập lại vào form
		            req.setAttribute("maloaitin", maloaitin);
		            req.setAttribute("tenloaitin", tenloaitin);
		            req.setAttribute("view", "/views/admin/loaitin/create.jsp"); // Chuyển tới form tạo
		            req.getRequestDispatcher("/views/admin/layout.jsp").forward(req, resp); // Giữ lại thông tin
		            return;
		        }
			Categories ct = new Categories();
			ct.setId(maloaitin);
			ct.setName(tenloaitin);
			
			dao.insert(ct);
			req.getSession().setAttribute("successMessage", "Thêm loại tin thành công!");
			resp.sendRedirect("/Assignment_NVC/loaitin/index");
		}else if (uri.contains("update")) {
	        String maloaitin = req.getParameter("id");
	        String tenloaitin = req.getParameter("name");
	        
	        Categories ct = new Categories();
	        ct.setId(maloaitin);
	        ct.setName(tenloaitin);
	        
	        dao.update(ct); 
	        req.getSession().setAttribute("successMessage", "Cập nhật loại tin thành công!");
	        resp.sendRedirect("/Assignment_NVC/loaitin/index");
		}else if (uri.contains("delete")) {
			String maloaitin = req.getParameter("id");
			dao.delete(maloaitin);
			req.getSession().setAttribute("successMessage", "Xóa loại tin thành công!");
			resp.sendRedirect("/Assignment_NVC/loaitin/index");
		}
	}
}
