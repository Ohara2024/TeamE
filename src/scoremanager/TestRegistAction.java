package scoremanager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestRegistAction")
public class TestRegistAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public TestRegistAction() {
        super();
    }

    // GETリクエストでアクセスされた場合（例：URL直接アクセスなど）
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JSPにフォワードする（空画面または初期表示）
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
    }

    // POSTリクエストでアクセスされた場合（フォーム送信時）
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // フォームから受け取ったパラメータ取得
        String year = request.getParameter("admissionYear");
        String className = request.getParameter("className");
        String subject = request.getParameter("subject");
        String examCount = request.getParameter("examCount");

        // 画面に表示する用のメッセージをセット
        String message = "検索条件： 入学年度=" + year +
                         ", クラス=" + className +
                         ", 科目=" + subject +
                         ", 回数=" + examCount;

        request.setAttribute("message", message);

        // JSPへフォワード
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
    }
}
