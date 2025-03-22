package crud.servlets.user;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import crud.DAO.NewsDAO;
import crud.DAO.NewseletterDAO;
import crud.entities.News;
import crud.entities.Newsletters;

@WebServlet({"/users/trangchu", "/users/thegioi", "/users/kinhdoanh", "/users/khoahoc", "/users/thethao", "/users/phapluat", 
	"/users/batdongsan", "/users/doisong", "/users/suckhoe", "/users/giaitri", "/users/giaoduc", "/users/podcasts","/users/email"})
public class Home_Servlet extends HttpServlet {
	
	NewseletterDAO dao = new NewseletterDAO(); 
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		NewsDAO newsDAO = new NewsDAO();
		HttpSession session = req.getSession();
		String uri = req.getRequestURI();
		

		// Xử lý trang chủ - chỉ hiển thị các tin tức có trạng thái "home" = true
		if(uri.contains("trangchu")) {
			List<News> newsList = newsDAO.selectAll();		
			ArrayList<News> filteredNewsList = new ArrayList<>();
			for (News news : newsList) {
			    if (news.isHome()) { 
			        filteredNewsList.add(news);
			    }
			}
			session.setAttribute("newsList", filteredNewsList);
			req.setAttribute("newslist", filteredNewsList);

			// Lấy danh sách tin tức theo từng danh mục và kiểm tra trạng thái "home"
			List<News> kinhDoanhNewsList = filterNewsByHome(newsDAO.selectByCategory("LT002"));
            req.setAttribute("kdnewsList", kinhDoanhNewsList);
            
            List<News> khoaHocNewList = filterNewsByHome(newsDAO.selectByCategory("LT003"));
			req.setAttribute("khnewsList", khoaHocNewList);
			
            List<News> theThaoNewList = filterNewsByHome(newsDAO.selectByCategory("LT004"));
			req.setAttribute("ttnewsList", theThaoNewList);
			
			List<News> batDongSanNewList = filterNewsByHome(newsDAO.selectByCategory("LT007"));
			req.setAttribute("bdsnewsList", batDongSanNewList);
			
			List<News> doiSongNewList = filterNewsByHome(newsDAO.selectByCategory("LT008"));
			req.setAttribute("dsnewsList", doiSongNewList);
			
			List<News> sucKhoetNewList = filterNewsByHome(newsDAO.selectByCategory("LT009"));
			req.setAttribute("sknewsList", sucKhoetNewList);
			
			List<News> giaiTriNewList = filterNewsByHome(newsDAO.selectByCategory("LT010"));
			req.setAttribute("gtnewsList", giaiTriNewList);
			
			List<News> giaoDucNewList = filterNewsByHome(newsDAO.selectByCategory("LT011"));
			req.setAttribute("gdnewsList", giaoDucNewList);
			
			List<News> podCastsNewList = filterNewsByHome(newsDAO.selectByCategory("LT012"));
			req.setAttribute("pdnewList", podCastsNewList);
			
			req.setAttribute("view", "/views/user/home.jsp");

		// Xử lý các danh mục khác tương tự nhưng không lọc theo trạng thái "home"
		} else if (uri.contains("thegioi")) {
			List<News> theGioiNewList = newsDAO.selectByCategory("LT001");
			req.setAttribute("tgnewsList", theGioiNewList);
			req.setAttribute("view", "/views/user/thegioi.jsp");
			
		} else if (uri.contains("kinhdoanh")) {
			List<News> kinhDoanhNewList = newsDAO.selectByCategory("LT002");
			req.setAttribute("kdnewsList", kinhDoanhNewList);
			req.setAttribute("view", "/views/user/kinhdoanh.jsp");
			
		} else if (uri.contains("khoahoc")) {
			List<News> khoaHocNewList = newsDAO.selectByCategory("LT003");
			req.setAttribute("khnewsList", khoaHocNewList);
			req.setAttribute("view", "/views/user/khoahoc.jsp");
			
		} else if (uri.contains("thethao")) {
			List<News> theThaoNewList = newsDAO.selectByCategory("LT004");
			req.setAttribute("ttnewsList", theThaoNewList);
			req.setAttribute("view", "/views/user/thethao.jsp");
			
		} else if (uri.contains("phapluat")) {
			List<News> phapLuatNewList = newsDAO.selectByCategory("LT005");
			req.setAttribute("plnewsList", phapLuatNewList);
			req.setAttribute("view", "/views/user/phapluat.jsp");
			
		} else if (uri.contains("batdongsan")) {
			List<News> batDongSanNewList = newsDAO.selectByCategory("LT007");
			req.setAttribute("bdsnewsList", batDongSanNewList);
			req.setAttribute("view", "/views/user/batdongsan.jsp");
			
		} else if (uri.contains("doisong")) {
			List<News> doiSongNewList = newsDAO.selectByCategory("LT008");
			req.setAttribute("dsnewsList", doiSongNewList);
			req.setAttribute("view", "/views/user/doisong.jsp");
			
		} else if (uri.contains("suckhoe")) {
			List<News> sucKhoetNewList = newsDAO.selectByCategory("LT009");
			req.setAttribute("sknewsList",sucKhoetNewList);
			req.setAttribute("view", "/views/user/suckhoe.jsp");
			
		} else if (uri.contains("giaitri")) {
			List<News> giaiTriNewList = newsDAO.selectByCategory("LT010");
			req.setAttribute("gtnewsList", giaiTriNewList);
			req.setAttribute("view", "/views/user/giaitri.jsp");
			
		} else if (uri.contains("giaoduc")) {
			List<News> giaoDucNewList = newsDAO.selectByCategory("LT011");
			req.setAttribute("gdnewsList", giaoDucNewList);
			req.setAttribute("view", "/views/user/giaoduc.jsp");
			
		} else if (uri.contains("podcasts")) {
			List<News> podCastsNewList = newsDAO.selectByCategory("LT012");
			req.setAttribute("pdnewList", podCastsNewList);
			req.setAttribute("view", "/views/user/podcasts.jsp");	
			
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		
		req.getRequestDispatcher("/views/user/layout_user.jsp").forward(req, resp);
	}

	// Hàm lọc tin tức có trạng thái "home"
	private List<News> filterNewsByHome(List<News> newsList) {
		List<News> filteredList = new ArrayList<>();
		for (News news : newsList) {
			if (news.isHome()) {
				filteredList.add(news);
			}
		}
		return filteredList;
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String uri = req.getRequestURI();
		if (uri.contains("email")) {
			
			String successMessage = "Đăng ký email thành công!";
			String errorMessage = "Email này đã được đăng ký!";
			String email = (String) req.getParameter("email");
			if (dao.selectById(email) == null) {
				dao.insert(new Newsletters(email, true));
				req.getSession().setAttribute("successMessage", successMessage);
			} else {
				req.getSession().setAttribute("errorMessage", errorMessage);
			}
			resp.sendRedirect("/Assignment_NVC/users/trangchu");
			
			
		}
	}
}
