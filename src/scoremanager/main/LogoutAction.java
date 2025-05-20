package scoremanager.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tool.Action;

public class LogoutAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession(false);
        if (session != null) {
            session.invalidate(); // セッションを破棄
        }
        return "login.jsp"; // ログイン画面に戻る
    }
}
