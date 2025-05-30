package student_management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import dao.SchoolDao;
import dao.StudentDao;
import tool.Action2;

public class StudentListAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();

        // ① セッションから schoolCd を取得
        String schoolCd = (String) session.getAttribute("schoolCd");


        // ② schoolCd を元に School オブジェクトを取得
        SchoolDao schoolDao = new SchoolDao();
        School school = schoolDao.get(schoolCd);
        if (school == null) {
            request.setAttribute("errorMessage", "学校情報の取得に失敗しました。");
            return "/main/error.jsp"; // 適宜エラーページに変更
        } //村本先生へ　ここができません

        // ③ リクエストパラメータを取得
        String entYearStr = request.getParameter("ent_year");
        String classNum = request.getParameter("class_num");
        String isAttendStr = request.getParameter("is_attend");

        List<Student> list;
        StudentDao dao = new StudentDao();

        if (entYearStr != null && classNum != null && isAttendStr != null) {
            int entYear = Integer.parseInt(entYearStr);
            boolean isAttend = Boolean.parseBoolean(isAttendStr);
            list = dao.filter(school, entYear, classNum, isAttend);
        } else {
            list = dao.filter(school, true);
        }

        request.setAttribute("list", list);

        return "/student_management/student_list.jsp";
    }
}

