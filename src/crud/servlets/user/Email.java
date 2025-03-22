package crud.servlets.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.DAO.NewseletterDAO;
import crud.entities.Newsletters;

@WebServlet("/email")
public class Email extends HttpServlet{
	NewseletterDAO dao = new NewseletterDAO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect(request.getContextPath());
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String successMessage = "Đăng ký email thành công!";
		String errorMessage = "Email này đã được đăng ký!";
		String email = (String) req.getParameter("email");
		if (dao.selectById(email) == null) {
			dao.insert(new Newsletters(email, true));
			req.getSession().setAttribute("successMessage", successMessage);
		} else {
			req.getSession().setAttribute("errorMessage", errorMessage);
		}
		resp.sendRedirect(req.getContextPath()+"/users/trangchu");
	}
}

