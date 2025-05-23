package subject_manager;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;  // Schoolクラスがbeanパッケージにある想定
import bean.Student;
import dao.StudentDao;

@WebServlet("/subjectmanager/TestRegistAction")
public class TestRegistAction extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String admissionYear = request.getParameter("admissionYear");
        String className = request.getParameter("className");
        String subject = request.getParameter("subject");
        String examCount = request.getParameter("examCount");

        if (admissionYear == null || admissionYear.isEmpty() ||
            className == null || className.isEmpty() ||
            subject == null || subject.isEmpty() ||
            examCount == null || examCount.isEmpty()) {

            request.setAttribute("error", "すべての項目を選択してください。");
            request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
            return;
        }

        try {
            // Schoolオブジェクトの作成・設定は適宜調整してください
            School school = new School();
            // 例: classNameを学校名に使う場合（実際の仕様に合わせてください）
            school.setName(className);

            int entYear = Integer.parseInt(admissionYear);
            boolean isAttend = true;  // ここは必要に応じて変える

            StudentDao studentDao = new StudentDao();
            List<Student> studentList = studentDao.filter(school, entYear, isAttend);

            request.setAttribute("studentList", studentList);
            request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "学生情報の取得に失敗しました。");
            request.getRequestDispatcher("/subject_manager/test_regist.jsp").forward(request, response);
        }
    }
} 
