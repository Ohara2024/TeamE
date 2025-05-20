package scoremanager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Teacher;
import bean.User;
import dao.TeacherDao;
import tool.Action;

public class LoginExecuteAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        String id = req.getParameter("id");
        String password = req.getParameter("password");

        TeacherDao dao = new TeacherDao();
        Teacher teacher = dao.login(id, password);

        if (teacher == null) {
            req.setAttribute("error", "ログインIDもしくはパスワードが間違っています。");
            return "error.jsp";  // ログイン失敗時はエラー画面へ
        }

        // ログイン成功
        User user = new User();
        user.setAuthenticated(true);
        HttpSession session = req.getSession();
        session.setAttribute("user", user);
        session.setAttribute("teacher", teacher);

        return "Menu.action"; // FrontController でリダイレクトされる
    }
}
