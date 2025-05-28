package test_management;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Student;
import bean.Subject;
import bean.Teacher;
import bean.TestListStudent;
import dao.ClassNumDao;
import dao.StudentDao;
import dao.SubjectDao;
import dao.TestListStudentDao;
import tool.Action;

@WebServlet(urlPatterns = {"/testmanagement/studentexe"})
public class TestListStudentExecuteAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

        // セッションから教師情報を取得
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // パラメータ取得
        String student_no = req.getParameter("f4");

        // DAOインスタンス作成
        StudentDao studentDao = new StudentDao();
        TestListStudentDao tlsDao = new TestListStudentDao();
        SubjectDao subjectDao = new SubjectDao();
        ClassNumDao cNumDao = new ClassNumDao();

        // 初期化
        Student student = null;
        List<TestListStudent> tlslist = new ArrayList<>();

        // 安全なnullチェック処理（★ここが今回の修正ポイント）
        if (student_no != null && !student_no.trim().isEmpty()) {
            student = studentDao.get(student_no);
            if (student != null) {
                tlslist = tlsDao.filter(student);
            }
        }

        // クラス情報と科目情報を取得
        List<String> cNumlist = cNumDao.filter(teacher.getSchool());
        List<Subject> list = subjectDao.filter(teacher.getSchool());

        // 入学年度リスト（過去10年〜未来10年）
        int year = LocalDate.now().getYear();
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i <= year + 10; i++) {
            entYearSet.add(i);
        }

        // リクエスト属性にセット
        req.setAttribute("student", student);
        req.setAttribute("tlslist", tlslist);
        req.setAttribute("f4", student_no);
        req.setAttribute("cNumlist", cNumlist);
        req.setAttribute("list", list);
        req.setAttribute("entYearSet", entYearSet);

        // JSPへフォワード
        req.getRequestDispatcher("/test_management/test_list_student.jsp").forward(req, res);
    }
}
