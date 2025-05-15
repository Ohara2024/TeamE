package student_management;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDao;

@WebServlet(urlPatterns = {"/studentmanagement/list"})
public class StudentList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            StudentDao dao = new StudentDao();

            String entYearParam = request.getParameter("entYear");
            String classNumParam = request.getParameter("classNum");
            String isAttendParam = request.getParameter("isAttend");
            Integer entYear = null;
            if (entYearParam != null && !entYearParam.isEmpty()) {
                entYear = Integer.parseInt(entYearParam);
            }
            Boolean isAttend = null;
            if ("on".equals(isAttendParam)) {
                isAttend = true;
            }


            List<Student> list = dao.filter(null, entYear, classNumParam, isAttend);

            request.setAttribute("list", list);

            request.getRequestDispatcher("/student_management/student_list.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/main/error.jsp").forward(request, response);
        }
    }
}
