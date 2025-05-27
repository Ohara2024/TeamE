package subject_management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectUpdateExecuteAction implements Action {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        School school = (School) request.getSession().getAttribute("school");
        if (school == null) {
            request.setAttribute("error", "学校情報がありません");
            return "/main/error.jsp";
        }

        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);
        subject.setSchool(school);

        SubjectDao dao = new SubjectDao();
        dao.save(subject);

        // 更新後は科目一覧へリダイレクト（フロントコントローラー経由で）
        response.sendRedirect(request.getContextPath() + "/subjectmanagement/list.action");
        return null; // リダイレクトしたのでviewは返さない
    }
}
