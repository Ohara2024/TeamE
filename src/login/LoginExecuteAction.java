package login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDao;

@WebServlet(urlPatterns = {"/login/loginexe"})
public class LoginExecuteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public LoginExecuteAction() { super(); }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        TeacherDao dao = new TeacherDao();
        Teacher teacher = null;

        try {
            teacher = dao.login(id, password);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        if (teacher == null) {

            request.setAttribute("error", "IDまたはパスワードが間違っています");
            request.getRequestDispatcher("/login/login.jsp").forward(request, response);
        } else {

            teacher.setAuthenticated(true);
            HttpSession session = request.getSession();
            session.setAttribute("user", teacher);
            response.sendRedirect(request.getContextPath() + "/menu/menuaction");

        }
    }
}
