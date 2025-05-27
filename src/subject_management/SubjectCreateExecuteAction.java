package subject_management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
import tool.Action;

public class SubjectCreateExecuteAction implements Action {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        School school = (School) session.getAttribute("school");
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

        // 登録成功後は科目一覧にリダイレクト（redirectなのでフロントコントローラーで処理させる）
        response.sendRedirect(request.getContextPath() + "/subjectmanagement/list.action");
        return null; // forwardしないのでnullを返す
    }
}
