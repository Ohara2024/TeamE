package student_management;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.StudentDao;
import tool.Action;

@WebServlet(urlPatterns = {"/student/update/execute"})
public class StudentUpdateExecuteAction extends Action {
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        Student student = new Student();
        student.setNo(req.getParameter("no"));
        student.setName(req.getParameter("name"));
        student.setEntYear(Integer.parseInt(req.getParameter("ent_year")));
        student.setClassNum(req.getParameter("class_num"));
        student.setAttend(Boolean.parseBoolean(req.getParameter("is_attend")));
        student.setSchool(school);

        StudentDao dao = new StudentDao();
        dao.save(student);

        req.setAttribute("student", student);
        req.getRequestDispatcher("/student_management/student_update_done.jsp").forward(req, res);
    }
}