package test_management;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Student;
import dao.StudentDao;

@WebServlet(urlPatterns = {"/testmanagement/list"})
public class TestListAction extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();

        try {
            StudentDao dao = new StudentDao();
			boolean isAttend = false;
			List<Student> student_list = dao.filter(getSchool(), isAttend );

            request.setAttribute("student_list", student_list);
            request.getRequestDispatcher("/test_management/test_list.jsp").forward(request, response);
        } catch (Exception e) {
        	request.getRequestDispatcher("/main/error.jsp").forward(request, response);
        }
    }
}
