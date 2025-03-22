package crud.servlets.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.DAO.NewseletterDAO;
import crud.entities.Newsletters;

@WebServlet({ "/newsletter/index", "/newsletter/create", "/newsletter/update/*", "/newsletter/delete" })
public class NEWSLETTERS_Servlet extends HttpServlet {
	NewseletterDAO dao = new NewseletterDAO();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("index")) {
			List<Newsletters> newSletterList = dao.selectAll();
			req.setAttribute("view", "/views/admin/newsletter/index.jsp");
			req.setAttribute("newsletter", newSletterList);
		} else if (uri.contains("create")) {
			req.setAttribute("view", "/views/admin/newsletter/create.jsp");

		} else if (uri.contains("update")) {
			String email = uri.substring(uri.lastIndexOf("/") + 1);
			Newsletters newsletter = dao.selectById(email);
			req.setAttribute("newsletter", newsletter);
			req.setAttribute("view", "/views/admin/newsletter/update.jsp");

		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;

		}
		req.getRequestDispatcher("/views/admin/layout.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.contains("create")) {
			String email = req.getParameter("email");
			boolean trangThai = Boolean.parseBoolean(req.getParameter("enabled"));

			Newsletters news = new Newsletters();
			news.setEmail(email);
			news.setEnabled(trangThai);
			dao.insert(news);
			req.getSession().setAttribute("message", "Thêm mới thành công!");
			resp.sendRedirect("/Assignment_NVC/newsletter/index");

		} else if (uri.contains("update")) {
			String email = req.getParameter("email");
			boolean trangThai = Boolean.parseBoolean(req.getParameter("enabled"));

			Newsletters news = new Newsletters();
			news.setEmail(email);
			news.setEnabled(trangThai);
			dao.update(news);
			req.getSession().setAttribute("message", "Cập nhật thành công!");
			resp.sendRedirect("/Assignment_NVC/newsletter/index");
		} else if (uri.contains("delete")) {
			String email = req.getParameter("email");
			dao.delete(email);
			req.getSession().setAttribute("message", "Xóa thành công!");
			resp.sendRedirect("/Assignment_NVC/newsletter/index");

		}
	}
}
