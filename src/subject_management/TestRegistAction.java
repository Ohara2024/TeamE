package subject_management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Student;
import dao.StudentDao;
import tool.Action2;

public class TestRegistAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
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
            return "/subject_management/test_regist.jsp";
        }

        try {
            School school = new School();
            school.setName(className); // Điều chỉnh theo thực tế

            int entYear = Integer.parseInt(admissionYear);
            boolean isAttend = true; // Điều chỉnh theo cần thiết

            StudentDao studentDao = new StudentDao();
            List<Student> studentList = studentDao.filter(school, entYear, isAttend);

            request.setAttribute("studentList", studentList);
            return "/subject_management/test_regist.jsp";
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "学生情報の取得に失敗しました。");
            return "/subject_management/test_regist.jsp";
        }
    }
}