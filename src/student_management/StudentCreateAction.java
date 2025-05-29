package student_management;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Teacher;
import dao.ClassNumDao;
import tool.Action;

@WebServlet(urlPatterns = {"/student/create"})
public class StudentCreateAction extends Action {

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        HttpSession session = req.getSession();
        Teacher teacher = (Teacher) session.getAttribute("user");
        School school = teacher.getSchool();

        // クラス番号リスト取得
        ClassNumDao classNumDao = new ClassNumDao();
        List<String> classNumList = classNumDao.filter(school);

        // 入学年度リスト生成（現在を基準に前後10年）
        List<Integer> entYearList = new ArrayList<>();
        int thisYear = LocalDate.now().getYear();
        for (int i = thisYear - 10; i <= thisYear + 10; i++) {
            entYearList.add(i);
        }

        // JSPへ渡す
        req.setAttribute("classNumList", classNumList);
        req.setAttribute("entYearList", entYearList);

        req.getRequestDispatcher("/student_management/student_create.jsp").forward(req, res);
    }
}

