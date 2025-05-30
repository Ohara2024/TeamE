package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import dao.TeacherDao;
import tool.Action2;

public class LoginExecuteAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String password = request.getParameter("password");

        TeacherDao dao = new TeacherDao();
        Teacher teacher = null;

        try {
            teacher = dao.login(id, password);
        } catch (Exception e) {
            throw new Exception(e);
        }

        if (teacher == null) {
            request.setAttribute("error", "IDまたはパスワードが間違っています");
            return "/login/login.jsp";
        } else {
            teacher.setAuthenticated(true);
            HttpSession session = request.getSession();
            session.setAttribute("user", teacher);
            return "redirect:/menu/menuaction.action";
        }
    }
}