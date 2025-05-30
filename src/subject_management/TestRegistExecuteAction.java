package subject_management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action2;

public class TestRegistExecuteAction extends Action2 {
    private static final String DB_URL = "jdbc:h2:~/exam";
    private static final String DB_USER = "sa";
    private static final String DB_PASS = "";

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        String subjectId = request.getParameter("subjectId");
        String examCount = request.getParameter("examCount"); // Cần thiết thì sử dụng

        boolean isSuccess = true;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            conn.setAutoCommit(false); // Bắt đầu transaction

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
                            score = -1; // Xử lý giá trị không hợp lệ
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

        // Trả về đường dẫn JSP để Action2 forward
        return "/subject_management/test_regist.jsp";
    }
}