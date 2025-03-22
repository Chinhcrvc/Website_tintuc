package crud.servlets.user;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import crud.DAO.NewsDAO;
import crud.entities.News;

@WebServlet("/chitiet/asm")
public class ChiTiet_Servlet extends HttpServlet{
	NewsDAO newsDAO = new NewsDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 	String id = req.getParameter("id"); 
	        News news = newsDAO.selectById(id); 
	        if (news != null) {
	            // Tăng số lượt xem lên 1 mỗi khi người dùng xem
	            news.setViewCount(news.getViewCount() + 1);
	            newsDAO.update(news); 
	        }
	        List<News> relatedNews = newsDAO.selectRelatedNews(news.getCategoryId(), id);
	        req.setAttribute("news", news); 
	        req.setAttribute("relatedNews", relatedNews);
	        req.setAttribute("view", "/views/user/detail.jsp");
	        req.getRequestDispatcher("/views/user/layout_chitiet.jsp").forward(req, resp);
	}
}
