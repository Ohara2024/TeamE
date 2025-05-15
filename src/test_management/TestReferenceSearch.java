package test_management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.ClassNum;

@WebServlet("/testreference/search")
public class TestReferenceSearch extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TestReferenceSearch search = new TestReferenceSearch();

        List<Integer> entYears = search.get("entYear);
        List<ClassNum> classList = search.getClassList();
        List<Subject> subjectList = search.getSubjectList();

        request.setAttribute("entYears", entYears);
        request.setAttribute("classList", classList);
        request.setAttribute("subjectList", subjectList);

        // Lấy tham số
        String entYearParam = request.getParameter("entYear");
        String classNumParam = request.getParameter("classNum");
        String subjectCdParam = request.getParameter("subjectCd");
        String studentNoParam = request.getParameter("studentNo");

        Integer entYear = null;
        if (entYearParam != null && !entYearParam.isEmpty()) {
            entYear = Integer.parseInt(entYearParam);
        }

        if (entYearParam != null || classNumParam != null || subjectCdParam != null || studentNoParam != null) {
            List<?> resultList = search.search(entYear, classNumParam, subjectCdParam, studentNoParam);
            request.setAttribute("resultList", resultList);
        }

        request.getRequestDispatcher("/WEB-INF/views/test_search.jsp").forward(request, response);
    }
}
