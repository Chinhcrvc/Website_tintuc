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

@WebServlet("/news/moinhat_nhieunhat_daxem")
public class MoiNhat_NhieuNhat_DaXem extends HttpServlet{
	NewsDAO newsDAO = new NewsDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Lấy danh sách 5 bản tin xem nhiều nhất
        List<News> top5MostViewedNews = newsDAO.selectTop5MostViewed();
        req.setAttribute("top5MostViewedNews", top5MostViewedNews);

        // Lấy danh sách 5 bản tin mới nhất
        List<News> recentNewsList = newsDAO.selectTop5MostRecent();
        req.setAttribute("recentNewsList", recentNewsList);

        // Lấy danh sách 5 bản tin đã xem
        List<News> mostViewedNewsList = newsDAO.selectTop5Viewed();
        req.setAttribute("mostViewedNewsList", mostViewedNewsList);
        
        req.setAttribute("view", "/views/user/moinhat_nhieunhat_daxem.jsp");
        req.getRequestDispatcher("/views/user/layout_nhieu_moi_daxem.jsp").forward(req, resp);
	}
}
