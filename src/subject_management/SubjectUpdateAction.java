package subject_management;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import dao.SubjectDao;
@WebServlet("/subjectmanagement/update")
public class SubjectUpdateAction extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String cd = req.getParameter("cd");
        HttpSession session = req.getSession();
        School school = (School) session.getAttribute("school");

        try {
            SubjectDao dao = new SubjectDao();
            Subject subject = dao.get(cd, school);
            req.setAttribute("subject", subject);
            RequestDispatcher dispatcher = req.getRequestDispatcher("/subject_management/subject_update.jsp");
            dispatcher.forward(req, res);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}


