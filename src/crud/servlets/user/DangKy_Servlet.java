package crud.servlets.user;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendmail/Assignment")
public class DangKy_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DangKy_Servlet() {
        super();
    }

    // Bổ sung doGet để hiển thị form đăng ký
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Chuyển hướng đến trang đăng ký
        request.getRequestDispatcher("/views/user/dangky.jsp").forward(request, response);
    }

    // Xử lý đăng ký và gửi email trong doPost
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy thông tin email từ form đăng ký
        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            // Bước 1: Cấu hình thuộc tính SMTP của email
            Properties props = new Properties();
            props.setProperty("mail.smtp.auth", "true");
            props.setProperty("mail.smtp.port", "587");
            props.setProperty("mail.smtp.starttls.enable", "true");
            props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");
            props.setProperty("mail.smtp.host", "smtp.gmail.com");

            // Bước 2: Xác thực và tạo phiên kết nối với máy chủ mail
            Session session = Session.getInstance(props, new Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    String username = "vietchinh10b4ttt@gmail.com";
                    String password = "awzb oksd zcxa pfgl"; 
                    return new PasswordAuthentication(username, password);
                }
            });

            try {
                // Bước 3: Tạo email
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress("vietchinh10b4ttt@gmail.com"));
                message.setRecipients(Message.RecipientType.TO, email);
                message.setSubject("Chào mừng bạn đến với trang web của chúng tôi", "utf-8");
                message.setText("Xin chào, Cảm ơn bạn đã đăng ký trên trang web của chúng tôi!", "utf-8", "html");
                message.setReplyTo(message.getFrom());

                // Bước 4: Gửi email
                Transport.send(message);

                // Bước 5: Chuyển hướng đến trang thành công hoặc hiển thị thông báo xác nhận
                request.setAttribute("message", "Đăng ký thành công! Vui lòng kiểm tra email.");
                request.getRequestDispatcher("/views/user/success.jsp").forward(request, response);
            } catch (MessagingException e) {
                e.printStackTrace();
                request.setAttribute("error", "Gửi email xác nhận thất bại.");
                request.getRequestDispatcher("/views/user/error.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Vui lòng nhập email hợp lệ.");
            request.getRequestDispatcher("/views/user/dangky.jsp").forward(request, response);
        }
    }
}
