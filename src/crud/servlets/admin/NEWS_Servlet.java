package crud.servlets.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import crud.DAO.CategoriesDAO;
import crud.DAO.NewsDAO;
import crud.DAO.NewseletterDAO;
import crud.entities.Categories;
import crud.entities.News;
import crud.entities.Newsletters;
@MultipartConfig
@WebServlet({"/tintuc/index", "/tintuc/create", "/tintuc/update/*", "/tintuc/delete"})
public class NEWS_Servlet extends HttpServlet{
	NewsDAO dao = new NewsDAO();
	CategoriesDAO ctdao = new CategoriesDAO();
	NewseletterDAO newselecetDAO = new NewseletterDAO();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8"); // Đặt mã hóa cho phản hồi
		req.setCharacterEncoding("UTF-8"); // Đặt mã hóa cho yêu cầu
		String uri = req.getRequestURI();
		if (uri.contains("index")) {
			List<News> tintucList = dao.selectAll();
			req.setAttribute("news", tintucList);
			req.setAttribute("view", "/views/admin/tintuc/index.jsp");
		} else if (uri.contains("create")) {
			List<Categories> categoryList = ctdao.selectAll();
			req.setAttribute("categories", categoryList);
			req.setAttribute("view", "/views/admin/tintuc/create.jsp");
		} else if (uri.contains("update")) {
			String id = uri.substring(uri.lastIndexOf("/") + 1);
	        News news = dao.selectById(id); 
	        req.setAttribute("news", news);
	        
	        List<Categories> categoryList = ctdao.selectAll();
	        req.setAttribute("categories", categoryList);
			req.setAttribute("view", "/views/admin/tintuc/update.jsp");
		} else {
			resp.sendError(HttpServletResponse.SC_NOT_FOUND);
		}
		req.getRequestDispatcher("/views/admin/layout.jsp").forward(req, resp);
	}
	
	
	private void sendEmail(String recipient,String title, String content) throws MessagingException {
        // Cài đặt thông tin gửi email
        String from = "vietchinh10b4ttt@gmail.com"; // Thay bằng email của bạn
        String password = "fcad jcsr zkwp ewvg"; // Thay bằng mật khẩu của bạn

        // Cấu hình thông tin máy chủ SMTP
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");

        // Tạo phiên làm việc với xác thực
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        // Tạo tin nhắn email
        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
        message.setSubject("Thông báo bài viết mới: "+title);
        message.setText("Nội: " + content);
        

        // Gửi email
        Transport.send(message);
    }
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		if(uri.contains("create")) {
			// Nhận phần hình ảnh từ request
			Part filePart = req.getPart("image"); // Nhận file từ form
			String fileName = filePart.getSubmittedFileName(); // Lấy tên file
			String path = req.getServletContext().getRealPath("/images"); // Đường dẫn đến thư mục lưu trữ hình ảnh
			filePart.write(path + "\\" + fileName); // Lưu file vào thư mục
			
			// Lấy thông tin từ request
			String matintuc = req.getParameter("id");
			String tieude = req.getParameter("title");
			String noidung = req.getParameter("content");
			String hinhanh = "/images/" + fileName; // Đường dẫn ảnh tương đối
			/* String ngaydangStr = req.getParameter("postedDate"); */
			Date ngaydang = new Date();
			String tacgia = req.getParameter("author");
			/* int soluotxem = Integer.parseInt(req.getParameter("viewCount")); */
			String maloaitin = req.getParameter("categoryId");
			boolean trangnhat = Boolean.parseBoolean(req.getParameter("home"));
			
			// Tạo đối tượng News và lưu vào cơ sở dữ liệu
			News news = new News();
			news.setId(matintuc);
			news.setTitle(tieude);
			news.setContent(noidung);
			news.setImage(hinhanh);
			news.setPostedDate(ngaydang);
			news.setAuthor(tacgia);
			news.setViewCount(0);
			news.setCategoryId(maloaitin);
			news.setHome(trangnhat);
			dao.insert(news);
			
			// Gửi email thông báo cho người đã đăng ký nhận tin
            List<Newsletters> subscribers = newselecetDAO.selectAll(); // Lấy danh sách đăng ký từ cơ sở dữ liệu
            for (Newsletters subscriber : subscribers) {
                if (subscriber.isEnabled()) { // Kiểm tra xem người dùng có bật nhận tin không
                    try {
                        sendEmail(subscriber.getEmail(),tieude,noidung); // Gửi email đến từng người đăng ký
                    } catch (MessagingException e) {
                        e.printStackTrace();
                        req.setAttribute("errorMessage", "Gửi email thất bại cho người dùng: " + subscriber.getEmail());
                    }
                }
            }
			req.getSession().setAttribute("message", "Thêm mới thành công!");
			resp.sendRedirect("/Assignment_NVC/tintuc/index");
		}else if (uri.contains("update")) {
			String matintuc = req.getParameter("id");
			News existingNews = dao.selectById(matintuc); // Lấy tin tức cũ
	        
	        String fileName;
	        Part filePart = req.getPart("image"); // Nhận file từ form
	        if (filePart.getSize() > 0) { // Nếu có file mới
	            fileName = filePart.getSubmittedFileName(); // Lấy tên file
	            String path = req.getServletContext().getRealPath("/images"); // Đường dẫn đến thư mục lưu trữ hình ảnh
	            filePart.write(path + "\\" + fileName); // Lưu file vào thư mục
	        } else {
	            // Nếu không có file mới, giữ nguyên file cũ
	            fileName = existingNews.getImage().substring(existingNews.getImage().lastIndexOf('/') + 1); // Giữ nguyên tên file cũ
	        }
	        
			//Lấy thông tin từ request
			String tieude = req.getParameter("title");
			String noidung = req.getParameter("content");
			String hinhanh = "/images/" + fileName; // Thêm timestamp để tránh cache
			String ngaydangStr = req.getParameter("postedDate");
			Date ngaydang = existingNews.getPostedDate();
			String tacgia = req.getParameter("author");
			int soluotxem = Integer.parseInt(req.getParameter("viewCount"));
			String maloaitin = req.getParameter("categoryId");
			boolean trangnhat = Boolean.parseBoolean(req.getParameter("home"));
			
			// Chuyển đổi chuỗi thành đối tượng Date
			if(ngaydangStr != null && !ngaydangStr.isEmpty()) {
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				try {
					ngaydang = sdf.parse(ngaydangStr);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			News news = new News();
			news.setId(matintuc);
			news.setTitle(tieude);
			news.setContent(noidung);
			news.setImage(hinhanh);
			news.setPostedDate(ngaydang);
			news.setAuthor(tacgia);
			news.setViewCount(soluotxem);
			news.setCategoryId(maloaitin);
			news.setHome(trangnhat);
			dao.update(news);
			
			req.getSession().setAttribute("message", "Cập nhật thành công!");
			resp.sendRedirect("/Assignment_NVC/tintuc/index");
		}else if (uri.contains("delete")) {
			String matintuc = req.getParameter("id");
			dao.delete(matintuc);
			req.getSession().setAttribute("message", "Xóa thành công!");
			resp.sendRedirect("/Assignment_NVC/tintuc/index");
		}
	}
}
