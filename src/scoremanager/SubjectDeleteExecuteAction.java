package scoremanager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import dao.SubjectDao;

@WebServlet("/servlet/scoremanager.SubjectDeleteExecuteAction")
public class SubjectDeleteExecuteAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // GETアクセス時は一覧画面へフォワード（またはリダイレクト）
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // ここでは一覧画面へフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/subject_list.jsp");
        dispatcher.forward(request, response);

        // もしリダイレクトしたいならコメントアウトを外す
        // response.sendRedirect(request.getContextPath() + "/subject_list.jsp");
    }

    // POSTで削除処理を実行
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String subjectId = request.getParameter("subjectId");
        boolean deleteResult = false;

        try {
            SubjectDao dao = new SubjectDao();
            Subject subject = new Subject();
            subject.setCd(subjectId);

            deleteResult = dao.delete(subject);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "科目の削除中にエラーが発生しました。");
        }

        if (deleteResult) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subject_delete_done.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMsg", "科目の削除に失敗しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/subject_list.jsp");
            dispatcher.forward(request, response);
        }
    }
}
