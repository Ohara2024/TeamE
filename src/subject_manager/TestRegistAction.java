package subject_manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDao;

@WebServlet("/subjectmanager/TestRegistAction")
public class TestRegistAction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JSPパスを /subject_manager に統一
        request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String admissionYear = request.getParameter("admissionYear");
        String className = request.getParameter("className");
        String subject = request.getParameter("subject");
        String examCount = request.getParameter("examCount");

        if (admissionYear == null || admissionYear.isEmpty() ||
            className == null || className.isEmpty() ||
            subject == null || subject.isEmpty() ||
            examCount == null || examCount.isEmpty()) {

            request.setAttribute("error", "すべての項目を選択してください。");
            request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
            return;
        }

        StudentDao studentDao = new StudentDao();
        List<Student> studentList = studentDao.findByConditions(admissionYear, className);

        request.setAttribute("studentList", studentList);
        request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
    }
}
