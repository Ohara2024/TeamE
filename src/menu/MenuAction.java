package menu;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import dao.SchoolDao;
import tool.Action2;

public class MenuAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // Lấy trường học và đặt vào session
        SchoolDao dao = new SchoolDao();
        School school = dao.get("oom"); // Cập nhật schoolCd theo thực tế
        request.getSession().setAttribute("school", school);

        // Trả về đường dẫn JSP để Action2 forward
        return "/main/menu.jsp";
    }
}