package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String id = request.getParameter("id");
        String password = request.getParameter("password");

        if (id == null || id.isEmpty() || password == null || password.isEmpty()) {
            request.setAttribute("error", "IDまたはパスワードを入力してください");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        if ("admin".equals(id) && "Passw0rd@123".equals(password)) {
            request.getSession().setAttribute("user", id);
            response.sendRedirect("menu.jsp");
        } else {
            request.setAttribute("error", "IDまたはパスワードが間違っています");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
