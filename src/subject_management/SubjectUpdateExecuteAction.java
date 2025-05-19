package subject_management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import dao.SubjectDao;

public class SubjectUpdateExecuteAction extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String cd = req.getParameter("cd");
        String name = req.getParameter("name");
        HttpSession session = req.getSession();
        School school = (School) session.getAttribute("school");

        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);
        subject.setSchool(school);

        try {
            SubjectDao dao = new SubjectDao();
            dao.save(subject);
            res.sendRedirect("SubjectListAction");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
