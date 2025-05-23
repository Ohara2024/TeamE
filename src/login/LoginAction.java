package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;

@WebServlet(urlPatterns = {"/login/loginaction"})
public class LoginAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginAction() { super(); }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");
        String password = request.getParameter("password");


        User user = new User();
    
        if (userId != null && password != null && password.equals("password")) {

            user.setAuthenticated(true);

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // Cấp schoolCd theo userId
            String schoolCd = null;
            if ("admin".equals(userId)) {
                schoolCd = "oom";
            } else if ("knaka".equals(userId)) {
                schoolCd = "tky";
            } else {
                // Nếu user không hợp lệ
                request.setAttribute("errorMessage", "ユーザーIDまたはパスワードが正しくありません。");
                request.getRequestDispatcher("/login/login.jsp").forward(request, response);
                return;
            }
            session.setAttribute("schoolCd", schoolCd);

            // Chuyển sang trang chính
            response.sendRedirect(request.getContextPath() + "/testmanagement/subjectexe");

        } else {
            request.setAttribute("errorMessage", "ユーザーIDまたはパスワードが正しくありません。");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        }
    }
}
