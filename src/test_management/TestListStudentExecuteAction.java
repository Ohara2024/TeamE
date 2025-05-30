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
import tool.Action2;

@WebServlet(urlPatterns = {"/testmanagement/studentexe"})
public class TestListStudentExecuteAction extends Action2 {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        // ローカル変数の指定1
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");

        // Kiểm tra teacher
        if (teacher == null) {
            req.setAttribute("errorMessage", "ログインしてください。");
            return "/test_management/test_list_student.jsp";
        }
        System.out.println("Teacher: " + teacher.getSchool());

        String student_no = ""; // 学生番号
        Student student = new Student(); // 学生
        TestListStudentDao tlsDao = new TestListStudentDao();
        StudentDao studentDao = new StudentDao();
        SubjectDao subjectDao = new SubjectDao();
        ClassNumDao cNumDao = new ClassNumDao(); // クラス番号Dao

        LocalDate todaysDate = LocalDate.now(); // LocalDateインスタンスを取得
        int year = todaysDate.getYear(); // 現在の年を取得
        List<TestListStudent> tlslist = new ArrayList<>();

        // リクエストパラーメーターの取得2
        student_no = req.getParameter("studentNo");
        System.out.println("Received student_no: " + student_no);

        // DBからの取得3
        student = studentDao.get(student_no);
        System.out.println("Student found: " + (student != null ? student.getNo() + " - " + student.getName() : "null"));
        if (student != null) {
            tlslist = tlsDao.filter(student);
            System.out.println("Test list size: " + (tlslist != null ? tlslist.size() : "null"));
        } else {
            req.setAttribute("errorMessage", "該当する学生が見つかりませんでした。");
        }

        List<String> cNumlist = cNumDao.filter(teacher.getSchool()); // クラス情報
        if (cNumlist == null) cNumlist = new ArrayList<>();
        System.out.println("cNumlist size: " + cNumlist.size());
        List<Subject> list = subjectDao.filter(teacher.getSchool()); // 科目情報
        if (list == null) list = new ArrayList<>();
        System.out.println("Subject list size: " + list.size());

        // ビジネスロジック4
        List<Integer> entYearSet = new ArrayList<>();
        for (int i = year - 10; i < year + 11; i++) {
            entYearSet.add(i);
        }

        // レスポンス値をセット6
        req.setAttribute("student", student);
        req.setAttribute("tlslist", tlslist);
        req.setAttribute("studentNo", student_no);
        req.setAttribute("cNumlist", cNumlist);
        req.setAttribute("list", list);
        req.setAttribute("entYearSet", entYearSet);

        // Trả về đường dẫn JSP để Action2 forward
        return "/test_management/test_list_student.jsp";
    }
}