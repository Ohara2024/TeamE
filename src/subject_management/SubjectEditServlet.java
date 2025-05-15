package subject_management;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import bean.Subject;
import dao.SubjectDao;

@WebServlet("/subject_edit")
public class SubjectEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 科目コードをリクエストパラメータから取得
            String cd = request.getParameter("cd");
            // 学校はセッションやリクエストなどから取得（例として固定値）
            School school = (School) request.getSession().getAttribute("school");
            if (school == null) {
                // 学校情報がなければエラー処理（ログインなどの前提があればそちらへリダイレクト）
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "学校情報がありません");
                return;
            }

            // DAOから科目を取得
            SubjectDao dao = new SubjectDao();
            Subject subject = dao.get(cd, school);

            if (subject == null) {
                request.setAttribute("error", "指定された科目が存在しません");
            } else {
                request.setAttribute("subject", subject);
            }

            // JSPへフォワード
            request.getRequestDispatcher("/subject_management/subject_edit.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
