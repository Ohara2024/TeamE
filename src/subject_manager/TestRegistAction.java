package subject_manager;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Subject;
import bean.TestListSubject;
import dao.Dao;
import dao.SubjectDao;
import dao.TestListSubjectDao;

@WebServlet("/TestRegistAction")
public class TestRegistAction extends HttpServlet {

    private SubjectDao subDao = new SubjectDao();
    private TestListSubjectDao tlsDao = new TestListSubjectDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // 1. パラメータ取得
        String action = request.getParameter("action"); // "search" or "register"
        String admissionYear = request.getParameter("admissionYear");
        String className = request.getParameter("className");
        String subjectId = request.getParameter("subject");
        String examCount = request.getParameter("examCount");

        List<TestListSubject> studentList = new ArrayList<>();
        Map<String, Integer> scoreMap = new HashMap<>();

        if (admissionYear != null && !admissionYear.isEmpty()
                && className != null && !className.isEmpty()
                && subjectId != null && !subjectId.isEmpty()
                && examCount != null && !examCount.isEmpty()) {

            int entYear = Integer.parseInt(admissionYear);
            String clsNum = className;
            int examCnt = Integer.parseInt(examCount);

            try {
                // 学生・成績一覧の取得
                studentList = tlsDao.filter(entYear, clsNum, subDao.findByCd(subjectId), null);
            } catch (Exception e) {
                throw new ServletException("成績一覧取得エラー", e);
            }

            if ("register".equals(action)) {
                // 得点登録処理
                try (Connection conn = new Dao().getConnection()) {
                    String sql = "INSERT INTO test (student_no, subject_cd, no, point) " +
                                 "VALUES (?, ?, ?, ?) " +
                                 "ON DUPLICATE KEY UPDATE point = ?";
                    PreparedStatement ps = conn.prepareStatement(sql);

                    for (TestListSubject tls : studentList) {
                        String studentNo = tls.getStudentNo();
                        String paramName = "point_" + studentNo;
                        String pointStr = request.getParameter(paramName);

                        if (pointStr != null && !pointStr.isEmpty()) {
                            try {
                                int point = Integer.parseInt(pointStr);
                                ps.setString(1, studentNo);
                                ps.setString(2, subjectId);
                                ps.setInt(3, examCnt);
                                ps.setInt(4, point);
                                ps.setInt(5, point);
                                ps.executeUpdate();
                            } catch (NumberFormatException e) {
                                System.err.println("不正な得点: " + pointStr);
                            }
                        }
                    }
                    ps.close();
                } catch (Exception e) {
                    throw new ServletException("得点登録中にエラーが発生しました", e);
                }
            }

            // 得点マップ作成（登録後の再表示）
            for (TestListSubject tls : studentList) {
                Integer point = null;
                try {
                    point = tls.getPoint(examCnt);
                } catch (Exception e) {
                    // 無視
                }
                if (point != null) {
                    scoreMap.put(tls.getStudentNo(), point);
                }
            }
        }

        // 年度・クラス・科目一覧セット
        List<Integer> yearList = Arrays.asList(2021, 2022, 2023, 2024, 2025);
        List<String> classList = Arrays.asList("A", "B", "C");
        List<Subject> subjectList = subDao.findAll();

        // JSPへ渡すデータをセット
        request.setAttribute("yearList", yearList);
        request.setAttribute("classList", classList);
        request.setAttribute("subjectList", subjectList);
        request.setAttribute("studentList", studentList);
        request.setAttribute("scoreMap", scoreMap);
        request.setAttribute("selectedYear", admissionYear);
        request.setAttribute("selectedClass", className);
        request.setAttribute("selectedSubjectId", subjectId);
        request.setAttribute("selectedExamCount", examCount);

        // JSPへフォワード
        request.getRequestDispatcher("test_regist.jsp").forward(request, response);
    }
}
