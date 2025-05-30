package login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.User;
import tool.Action2;

public class LoginAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // Xử lý GET: Hiển thị form đăng nhập
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
                request.setAttribute("errorMessage", "ユーザーIDまたはパスワードが正しくありません。");
                return "/login/login.jsp";
            }
            session.setAttribute("schoolCd", schoolCd);
        } else {
            request.setAttribute("errorMessage", "ユーザーIDまたはパスワードが正しくありません。");
            return "/login/login.jsp";
        }

        // Giả định sau khi đăng nhập thành công, redirect về menu
        return "redirect:/menu/menuaction.action";
    }
}