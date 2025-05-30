package subject_management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;
import tool.Action2;

public class SubjectDeleteExecuteAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        String cd = request.getParameter("cd");
        boolean deleteResult = false;

        try {
            SubjectDao dao = new SubjectDao();
            Subject subject = new Subject();
            subject.setCd(cd);
            deleteResult = dao.delete(subject);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "科目の削除中にエラーが発生しました。");
        }

        if (deleteResult) {
            return "/subject_management/subject_delete_done.jsp";
        } else {
            request.setAttribute("errorMsg", "科目の削除に失敗しました。");
            return "/subject_management/subject_list.jsp";
        }
    }
}