package student_management;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import bean.Teacher;
import dao.ClassNumDao;
import dao.StudentDao;
import tool.Action;

@WebServlet(urlPatterns = {"/student/update"})
public class StudentUpdateAction extends Action {
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        String no = req.getParameter("no");
        StudentDao studentDao = new StudentDao();
        Student student = studentDao.get(no);

        ClassNumDao classDao = new ClassNumDao();
        List<String> classNumList = classDao.filter(school);

        List<Integer> entYearList = new ArrayList<>();
        int thisYear = LocalDate.now().getYear();
        for (int i = thisYear - 10; i <= thisYear + 10; i++) {
            entYearList.add(i);
        }

        req.setAttribute("student", student);
        req.setAttribute("classNumList", classNumList);
        req.setAttribute("entYearList", entYearList);

        req.getRequestDispatcher("/student_management/student_update.jsp").forward(req, res);
    }
}
