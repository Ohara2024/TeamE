package student_management;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import dao.StudentDao;

public class StudentListAction extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            HttpSession session = request.getSession();
            School school = (School) session.getAttribute("loginSchool");

            String entYearStr = request.getParameter("ent_year");
            String classNum = request.getParameter("class_num");
            String isAttendStr = request.getParameter("is_attend");

            List<Student> list;
            StudentDao dao = new StudentDao();

            if (entYearStr != null && classNum != null && isAttendStr != null) {
                int entYear = Integer.parseInt(entYearStr);
                boolean isAttend = Boolean.parseBoolean(isAttendStr);
                list = dao.filter(school, entYear, classNum, isAttend);
            } else {
                list = dao.filter(school, true);
            }

            request.setAttribute("list", list);
            RequestDispatcher rd = request.getRequestDispatcher("/student_list.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}