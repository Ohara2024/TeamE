package subject_management;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;

@WebServlet("/subjectmanagement/list")
public class SubjectListAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // --- 仮の School をセッションにセット（最低限のテスト用） ---
            School school = (School) request.getSession().getAttribute("school");
            if (school == null) {
                school = new School();
                school.setCd("A001"); // 実際のDBに存在するschool_cdを指定してください
                school.setName("テスト高校");
                request.getSession().setAttribute("school", school);
            }
            // -----------------------------------------------------

            // 科目一覧を取得
            SubjectDao dao = new SubjectDao();
            List<Subject> list = dao.filter(school);
            request.setAttribute("list", list);

            // JSPへフォワード
            request.getRequestDispatcher("/subject_management/subject_list.jsp").forward(request, response);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}