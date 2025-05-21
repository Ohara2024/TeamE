package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ClassDAO;
import model.StudentDAO;

public class StudentRegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 入学年度リスト生成（現在年 ±10年）
        int thisYear = Calendar.getInstance().get(Calendar.YEAR);
        List<Integer> entYearList = new ArrayList<>();
        for (int i = -10; i <= 10; i++) {
            entYearList.add(thisYear + i);
        }

        // クラスリスト取得（仮：固定データでもOK）
        ClassDAO classDao = new ClassDAO();
        List<String> classList = classDao.findAll();

        // リクエストにセット
        request.setAttribute("entYearList", entYearList);
        request.setAttribute("classList", classList);

        // JSPへフォワード
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/student_register.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String entYear = request.getParameter("ent_year");
        String no = request.getParameter("no");
        String name = request.getParameter("name");
        String classNum = request.getParameter("class_num");

        // 登録処理（DAOなど）
        StudentDAO studentDao = new StudentDAO();
        studentDao.insert(entYear, no, name, classNum);

        // 完了画面へ遷移
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/student_register_done.jsp");
        dispatcher.forward(request, response);
    }
}
