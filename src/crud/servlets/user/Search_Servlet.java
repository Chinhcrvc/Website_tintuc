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

@WebServlet("/search")
public class Search_Servlet extends HttpServlet {
    NewsDAO newsDao = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        // Lấy từ khóa tìm kiếm từ request
        String keyword = req.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {
        	 req.setAttribute("message", "Vui lòng nhập từ khóa tìm kiếm.");
             req.setAttribute("newsList", null); 
            return;
        }

        List<News> newsList = newsDao.searchByKeyword(keyword);

        if (newsList.isEmpty()) {
        	 req.setAttribute("message", "Không tìm thấy kết quả nào cho từ khóa: " + keyword);
             req.setAttribute("newsList", null); 
        } else {
            req.setAttribute("newsList", newsList);
        }
        req.setAttribute("view", "/views/user/search.jsp");
        req.getRequestDispatcher("/views/user/layout_search.jsp").forward(req, resp);
    }
}
