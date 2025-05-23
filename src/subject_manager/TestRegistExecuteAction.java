package subject_manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/subjectmanager/TestRegistExecuteAction")
public class TestRegistExecuteAction extends HttpServlet {

    private static final String DB_URL = "jdbc:h2:~/exam";
    private static final String DB_USER = "sa";
    private static final String DB_PASS = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("message", "このページはフォームからの登録時に利用してください。");
        request.getRequestDispatcher("/test_regist.jsp").forward(request, response);
    }

    // POSTメソッド（フォーム送信時）
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String subjectId = request.getParameter("subjectId");
        String examCount = request.getParameter("examCount"); // 必要なら利用

        boolean isSuccess = true;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            conn.setAutoCommit(false);  // トランザクション開始

            String sql = "INSERT INTO test_scores (student_id, subject_id, score) VALUES (?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                for (String paramName : request.getParameterMap().keySet()) {
                    if (paramName.startsWith("score_")) {
                        String studentId = paramName.substring("score_".length());
                        String scoreStr = request.getParameter(paramName);
                        int score = 0;
                        try {
                            score = Integer.parseInt(scoreStr);
                        } catch (NumberFormatException e) {
                            score = -1; // 無効値として扱う
                        }
                        if (score >= 0) {
                            ps.setString(1, studentId);
                            ps.setString(2, subjectId);
                            ps.setInt(3, score);
                            ps.addBatch();
                        }
                    }
                }
                ps.executeBatch();
            }
            conn.commit();

        } catch (SQLException e) {
            e.printStackTrace();
            isSuccess = false;
        }

        if (isSuccess) {
            request.setAttribute("message", "登録が完了しました");
        } else {
            request.setAttribute("message", "登録に失敗しました");
        }

        request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
    }
}
