package subject_management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectListAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        School school = (School) request.getSession().getAttribute("school");
        if (school == null) {
            request.setAttribute("error", "学校情報がありません");
            return "/main/error.jsp";
        }

        SubjectDao dao = new SubjectDao();
        List<Subject> list = dao.filter(school);

        request.setAttribute("subjectList", list);  // ← ここを修正
        return "/subject_management/subject_list.jsp";
    }
}
