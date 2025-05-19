package subject_manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Subject;
import dao.SubjectDao;

@WebServlet("/SubjectDeleteAction")
public class SubjectDeleteAction extends HttpServlet {

    // GET: 削除確認画面に遷移
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            // セッションから学校情報を取得
            HttpSession session = request.getSession();
            School school = (School) session.getAttribute("school");

            // パラメータから科目コード取得
            String cd = request.getParameter("cd");

            // DAOで該当の科目情報を取得
            SubjectDao dao = new SubjectDao();
            Subject subject = dao.get(cd, school);

            // リクエストにsubjectをセットし、JSPへ
            request.setAttribute("subject", subject);
            RequestDispatcher dispatcher = request.getRequestDispatcher("subject_delete.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "削除画面の表示中にエラーが発生しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("subject_list.jsp");
            dispatcher.forward(request, response);
        }
    }

    // POST: 実際に削除を実行
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            request.setCharacterEncoding("UTF-8");

            // セッションから学校情報を取得
            HttpSession session = request.getSession();
            School school = (School) session.getAttribute("school");

            // パラメータから科目コード取得
            String cd = request.getParameter("cd");

            // Subjectオブジェクトを構築
            Subject subject = new Subject();
            subject.setCd(cd);
            subject.setSchool(school);

            // DAOで削除実行
            SubjectDao dao = new SubjectDao();
            dao.delete(subject);

            // 一覧画面にリダイレクト
            response.sendRedirect("subject_list.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "削除処理中にエラーが発生しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("subject_delete.jsp");
            dispatcher.forward(request, response);
        }
    }
}
