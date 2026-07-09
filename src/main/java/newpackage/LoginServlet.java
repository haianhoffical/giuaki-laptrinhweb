package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String password = request.getParameter("password");

            // BĂM MẬT KHẨU VÀ KIỂM TRA
            String hashedPass = SecurityUtil.hashPassword(password);
            
            UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
            User user = db.logUser(name, hashedPass);
            
            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("logUser", user);
                response.sendRedirect("manage.jsp"); // Chuyển hướng sang trang quản lý môn học
            } else {
                out.println("<script>alert('Sai Username hoặc Password!'); window.location.href='login.jsp';</script>");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}