package scoremanager;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action;

public class MenuAction implements Action {
    public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        return "menu.jsp";
    }
}
