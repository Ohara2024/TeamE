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

<<<<<<< HEAD
        // JSPへフォワード
        req.getRequestDispatcher("/test_management/test_list_student.jsp").forward(req, res);
    }
=======
		SubjectDao subjectDao = new SubjectDao();

		ClassNumDao cNumDao = new ClassNumDao(); // クラス番号Dao

		LocalDate todaysDate = LocalDate.now(); // LocalDateインスタンスを取得

		int year = todaysDate.getYear(); // 現在の年を取得

		List<TestListStudent> tlslist = new ArrayList<>();

		// リクエストパラーメーターの取得2

		student_no = req.getParameter("f4");

		// DBからの取得3

		student = studentDao.get(student_no);
		if (student != null) {
		    tlslist = tlsDao.filter(student);
		} else {
		    req.setAttribute("errorMessage", "指定された学生番号の学生が見つかりません。");
		}


		List<String>cNumlist = cNumDao.filter(teacher.getSchool()); //クラス情報

		List<Subject>list = subjectDao.filter(teacher.getSchool()); //科目情報

		//ビジネスロジック4

		// リストを初期化

		List<Integer> entYearSet = new ArrayList<>();

		// 10年前から10年後まで年をリストに追加

		for (int i = year - 10; i < year + 11; i++) {

			entYearSet.add(i);

		}

		// レスポンス値をセット6

		// リクエストに学生情報をセット

		req.setAttribute("student", student);

		// リクエストに学生別一覧をセット

		req.setAttribute("tlslist", tlslist);

		// リクエストに学生番号をセット

		req.setAttribute("f4", student_no);

		//リクエストにクラス情報リストをセット

		req.setAttribute("cNumlist", cNumlist);

		//リクエストに科目情報リストをセット

		req.setAttribute("list", list);

		//リクエストに入学年度リストをセット

		req.setAttribute("entYearSet", entYearSet);

		// フォワード7

		req.getRequestDispatcher("/test_management/test_list_student.jsp").forward(req, res);

	}

>>>>>>> branch 'khang2' of https://github.com/Ohara2024/TeamE
}
