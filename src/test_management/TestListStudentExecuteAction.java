package test_management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import bean.TestListStudent;
import dao.SchoolDao;
import dao.StudentDao;
import dao.TestListStudentDao;
import tool.Action;

public class TestListStudentExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        // Lấy session và school
        HttpSession session = req.getSession();
        SchoolDao schoolDao = new SchoolDao();
        School school = schoolDao.get("S001");

        // Lấy mã sinh viên từ request
        String studentNo = req.getParameter("studentNo");

        // Kiểm tra input
        if (studentNo == null || studentNo.isEmpty()) {
            req.setAttribute("errorMessage", "学生番号を入力してください。");
            req.getRequestDispatcher("/test_management/test_list_student.jsp").forward(req, res);
            return;
        }

        // Lấy dữ liệu sinh viên
        StudentDao studentDao = new StudentDao();
        Student student = studentDao.get(studentNo);

        if (student == null) {
            req.setAttribute("errorMessage", "該当の学生が存在しません。");
            req.getRequestDispatcher("/test_management/test_list_student.jsp").forward(req, res);
            return;
        }

        // Lấy kết quả điểm theo sinh viên
        TestListStudentDao testListStudentDao = new TestListStudentDao();
        List<TestListStudent> resultList = testListStudentDao.filter(student);

        // Truyền dữ liệu ra JSP
        req.setAttribute("student", student);
        req.setAttribute("resultList", resultList);

        // Forward đến JSP kết quả
        req.getRequestDispatcher("/test_management/test_list_student_result.jsp").forward(req, res);
    }
}
