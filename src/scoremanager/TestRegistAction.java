package scoremanager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Teacher;

@WebServlet("/TestRegistAction")
public class TestRegistAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestRegistAction() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォワードで登録画面を表示（初期表示）
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
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

        // 確認表示用メッセージ
        String message = "入力された教員情報： ID = " + id +
                         ", 名前 = " + name +
                         ", 学校ID = " + schoolId;

        // リクエストにセットしてJSPへ渡す
        request.setAttribute("teacher", teacher);
        request.setAttribute("message", message);

        // JSPにフォワード
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
    }
}
