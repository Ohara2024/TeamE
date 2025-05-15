package subject_management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;

@WebServlet("/subject_update")
public class SubjectUpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            request.setCharacterEncoding("UTF-8");

            String cd = request.getParameter("cd");
            String name = request.getParameter("name");

            School school = (School) request.getSession().getAttribute("school");
            if (school == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "学校情報がありません");
                return;
            }

            Subject subject = new Subject();
            subject.setCd(cd);
            subject.setName(name);
            subject.setSchool(school);

            SubjectDao dao = new SubjectDao();
            boolean success = dao.save(subject);  // saveは更新も対応済み

            if (success) {
                response.sendRedirect(request.getContextPath() + "/subject_management/subject_update_done.jsp");
            } else {
                request.setAttribute("error", "更新に失敗しました");
                request.getRequestDispatcher("/subject_management/subject_edit.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
