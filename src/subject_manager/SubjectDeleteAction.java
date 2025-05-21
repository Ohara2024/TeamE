package subject_manager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;

@WebServlet("/scoremanager/SubjectDeleteAction")
public class SubjectDeleteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GET または POST どちらでもOKですが、通常はGETで表示する想定
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // リクエストパラメータから科目コード取得
        String cd = request.getParameter("cd");
        if (cd == null || cd.isEmpty()) {
            // パラメータなしなら科目一覧にリダイレクト
            response.sendRedirect(request.getContextPath() + "/scoremanager/SubjectListAction");
            return;
        }

        try {
            SubjectDao dao = new SubjectDao();

            // 科目コードで科目を検索
            Subject subject = dao.findByCd(cd);

            if (subject == null) {
                // 見つからなければエラーをセットして一覧に戻す
                request.setAttribute("error", "該当の科目が見つかりません。");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/scoremanager/subject_list.jsp");
                dispatcher.forward(request, response);
                return;
            }

            // 科目情報をリクエスト属性にセットして削除確認画面へフォワード
            request.setAttribute("subject", subject);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/scoremanager/subject_delete.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "科目情報の取得中にエラーが発生しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/scoremanager/subject_list.jsp");
            dispatcher.forward(request, response);
        }
    }

    // POSTアクセスが来た場合もGET処理に丸投げして対応可能
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
