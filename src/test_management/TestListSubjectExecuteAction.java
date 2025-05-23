package test_management;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import bean.Teacher;
import bean.TestListSubject;
import dao.ClassNumDao;
import dao.SchoolDao;
import dao.StudentDao;
import dao.SubjectDao;
import dao.TestListSubjectDao;
import tool.Action;

@WebServlet(urlPatterns = {"/testmanagement/subjectexe"})
public class TestListSubjectExecuteAction extends Action {

    private List<Integer> getEntYearList() {
        List<Integer> list = new ArrayList<>();
        int currentYear = LocalDate.now().getYear();
        for (int i = currentYear - 10; i <= currentYear + 10; i++) {
            list.add(i);
        }
        return list;
    }

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession();
        String schoolCd = (String) session.getAttribute("schoolCd");

        if (schoolCd == null || schoolCd.isEmpty()) {
            req.setAttribute("errorMessage", "学校情報が取得できません。");
            req.getRequestDispatcher("/test_management/test_list.jsp").forward(req, res);
            return;
        }

        SchoolDao schoolDao = new SchoolDao();
        School school = schoolDao.get(schoolCd);

        String entYearStr = req.getParameter("entranceYear");
        String classNum = req.getParameter("classNum");
        String subjectCd = req.getParameter("subject");
        String studentNo = req.getParameter("studentNo");

        Integer entYear = null;
        if (entYearStr != null && !entYearStr.isEmpty()) {
            entYear = Integer.parseInt(entYearStr);
        }

        StudentDao studentDao = new StudentDao();
        SubjectDao subjectDao = new SubjectDao();
        TestListSubjectDao testListSubjectDao = new TestListSubjectDao();

        Subject subject = null;
        if (subjectCd != null && !subjectCd.isEmpty()) {
            subject = subjectDao.get(subjectCd, school);
            if (subject == null) {
                req.setAttribute("errorMessage", "該当の科目が存在しません。");
                req.getRequestDispatcher("/test_management/test_list.jsp").forward(req, res);
                return;
            }
        }

        if (entYear == null) entYear = 0;
        if (classNum == null) classNum = "";

        List<TestListSubject> resultList = testListSubjectDao.filter(entYear, classNum, subject, school);
        req.setAttribute("resultList", resultList);

        // Truyền lại danh sách dropdown + giá trị đã chọn
        Teacher teacher = (Teacher) session.getAttribute("user");
        ClassNumDao classNumDao = new ClassNumDao();

        req.setAttribute("entYearSet", getEntYearList());
        req.setAttribute("cNumlist", classNumDao.filter(teacher.getSchool()));
        req.setAttribute("list", subjectDao.filter(teacher.getSchool()));
        req.setAttribute("selectedYear", entYear);
        req.setAttribute("selectedClass", classNum);
        req.setAttribute("selectedSubject", subjectCd);

        req.getRequestDispatcher("/test_management/test_list_subject.jsp").forward(req, res);
    }
}
