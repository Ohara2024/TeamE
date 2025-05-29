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
import dao.SubjectDao;
import dao.TestListSubjectDao;
import tool.Action2;

@WebServlet(urlPatterns = {"/testmanagement/subjectexe"})
public class TestListSubjectExecuteAction extends Action2 {

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
        Teacher teacher = (Teacher) session.getAttribute("user");

        if (teacher == null || teacher.getSchool() == null) {
            req.setAttribute("errorMessage", "ログイン情報または学校情報が取得できません。");
            req.getRequestDispatcher("/test_management/test_list.jsp").forward(req, res);
            return;
        }

        School school = teacher.getSchool();
        String entYearStr = req.getParameter("entranceYear");
        String classNum = req.getParameter("classNum");
        String subjectCd = req.getParameter("subject");

        // Validation: Cần ít nhất entYear, classNum, và subjectCd
        if ((entYearStr == null || entYearStr.isEmpty()) || (classNum == null || classNum.isEmpty()) || (subjectCd == null || subjectCd.isEmpty())) {
            req.setAttribute("errorMessage", "入学年度、クラス、科目のいずれかを指定してください。");
            req.setAttribute("entYearSet", getEntYearList());
            req.setAttribute("cNumlist", new ClassNumDao().filter(school));
            req.setAttribute("list", new SubjectDao().filter(school));
            req.setAttribute("selectedYear", entYearStr);
            req.setAttribute("selectedClass", classNum);
            req.setAttribute("selectedSubject", subjectCd);
            req.getRequestDispatcher("/test_management/test_list_subject.jsp").forward(req, res);
            return;
        }

        Integer entYear = null;
        try {
            entYear = Integer.parseInt(entYearStr);
        } catch (NumberFormatException e) {
            req.setAttribute("errorMessage", "入学年度は数値で指定してください。");
            req.setAttribute("entYearSet", getEntYearList());
            req.setAttribute("cNumlist", new ClassNumDao().filter(school));
            req.setAttribute("list", new SubjectDao().filter(school));
            req.setAttribute("selectedYear", entYearStr);
            req.setAttribute("selectedClass", classNum);
            req.setAttribute("selectedSubject", subjectCd);
            req.getRequestDispatcher("/test_management/test_list_subject.jsp").forward(req, res);
            return;
        }

        SubjectDao subjectDao = new SubjectDao();
        TestListSubjectDao testListSubjectDao = new TestListSubjectDao();
        Subject subject = subjectDao.get(subjectCd, school);

        if (subject == null) {
            req.setAttribute("errorMessage", "指定された科目（コード: " + subjectCd + "）が存在しません。");
            req.setAttribute("entYearSet", getEntYearList());
            req.setAttribute("cNumlist", new ClassNumDao().filter(school));
            req.setAttribute("list", subjectDao.filter(school));
            req.setAttribute("selectedYear", entYear);
            req.setAttribute("selectedClass", classNum);
            req.setAttribute("selectedSubject", subjectCd);
            req.getRequestDispatcher("/test_management/test_list_subject.jsp").forward(req, res);
            return;
        }

        List<TestListSubject> resultList = new ArrayList<>();

        try {
            resultList = testListSubjectDao.filter(entYear, classNum, subject, school);
            if (resultList.isEmpty()) {
                req.setAttribute("errorMessage", "選択された科目（" + subject.getName() + "）に該当する成績データが見つかりませんでした。");
            }
        } catch (Exception e) {
            req.setAttribute("errorMessage", "データ取得中にエラーが発生しました: " + e.getMessage());
        }

        req.setAttribute("resultList", resultList);
        req.setAttribute("entYearSet", getEntYearList());
        req.setAttribute("cNumlist", new ClassNumDao().filter(school));
        req.setAttribute("list", subjectDao.filter(school));
        req.setAttribute("selectedYear", entYear);
        req.setAttribute("selectedClass", classNum);
        req.setAttribute("selectedSubject", subjectCd);
        req.setAttribute("subjectName", subject.getName());

        req.getRequestDispatcher("/test_management/test_list_subject.jsp").forward(req, res);
    }
}