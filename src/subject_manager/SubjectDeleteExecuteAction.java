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

@WebServlet("/scoremanager/SubjectDeleteExecuteAction")
public class SubjectDeleteExecuteAction extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GETは一覧へリダイレクト
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect(request.getContextPath() + "/scoremanager/SubjectListAction");
    }

    // POSTは削除処理
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String cd = request.getParameter("cd");
        boolean deleteResult = false;

        try {
            SubjectDao dao = new SubjectDao();
            Subject subject = new Subject();
            subject.setCd(cd);
            deleteResult = dao.delete(subject);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMsg", "科目の削除中にエラーが発生しました。");
        }

        if (deleteResult) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/scoremanager/subject_delete_done.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("errorMsg", "科目の削除に失敗しました。");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/scoremanager/subject_list.jsp");
            dispatcher.forward(request, response);
        }
    }
}
