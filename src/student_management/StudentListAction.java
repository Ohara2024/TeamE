package student_management;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.School;
import bean.Student;
import dao.StudentDao;
import tool.Action2;

public class StudentListAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        // Lấy session và thông tin trường học
        HttpSession session = request.getSession();
        School school = (School) session.getAttribute("loginSchool");

        // Lấy tham số từ request
        String entYearStr = request.getParameter("ent_year");
        String classNum = request.getParameter("class_num");
        String isAttendStr = request.getParameter("is_attend");

        // Lọc danh sách sinh viên
        List<Student> list;
        StudentDao dao = new StudentDao();

        if (entYearStr != null && classNum != null && isAttendStr != null) {
            int entYear = Integer.parseInt(entYearStr);
            boolean isAttend = Boolean.parseBoolean(isAttendStr);
            list = dao.filter(school, entYear, classNum, isAttend);
        } else {
            list = dao.filter(school, true);
        }

        // Đặt danh sách vào request để hiển thị trên JSP
        request.setAttribute("list", list);

        // Trả về đường dẫn JSP
        return "/student_management/student_list.jsp";
    }
}