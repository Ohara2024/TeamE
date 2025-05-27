package subject_management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectUpdateAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        School school = (School) request.getSession().getAttribute("school");
        if (school == null) {
            request.setAttribute("error", "学校情報がありません");
            return "/main/error.jsp";
        }

        String cd = request.getParameter("cd");
        SubjectDao dao = new SubjectDao();
        Subject subject = dao.get(cd, school);

        request.setAttribute("subject", subject);
        return "/subject_management/subject_update.jsp";
    }
}
