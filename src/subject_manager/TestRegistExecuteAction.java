package subject_manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Teacher;

@WebServlet("/TestRegistExecuteAction")
public class TestRegistExecuteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestRegistExecuteAction() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 入力フォームから教員データ取得
        String id = request.getParameter("teacherId");
        String password = request.getParameter("password");
        String name = request.getParameter("teacherName");
        String schoolId = request.getParameter("schoolId");

        // Teacherインスタンス生成
        Teacher teacher = new Teacher();
        teacher.setId(id);
        teacher.setPassword(password);
        teacher.setName(name);

        School school = new School();
        school.setCd(schoolId);
        teacher.setSchool(school);

        // 登録処理（本来はDBに登録処理を書く）
        // 例: TeacherDao.insert(teacher);

        // メッセージをセット
        String message = "教員情報の登録が完了しました。";

        // リクエストに属性を設定
        request.setAttribute("message", message);
        request.setAttribute("teacher", teacher);

        // 完了画面にフォワード
        request.getRequestDispatcher("test_regist_done.jsp").forward(request, response);
    }
}
