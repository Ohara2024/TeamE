package subject_management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SubjectDao;

@WebServlet("/registerSubject")
public class SubjectRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 文字化け防止（POSTでの日本語処理）
        request.setCharacterEncoding("UTF-8");

        // フォームからのデータ取得
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        // Beanにデータをセット
        Subject subject = new Subject();
        subject.setCd(cd);
        subject.setName(name);

        // DAOを使ってDBに登録
        SubjectDao dao = new SubjectDao();
        boolean success = dao.insert(subject);

        if (success) {
            // 登録成功 → 完了画面へリダイレクト
            response.sendRedirect(request.getContextPath() + "/subject_management/subject_register_done.jsp");
        } else {
            // 登録失敗 → 入力画面に戻す（例として）
            request.setAttribute("error", "登録に失敗しました");
            request.getRequestDispatcher("/subject_management/subject_register.jsp").forward(request, response);
        }
    }
}
