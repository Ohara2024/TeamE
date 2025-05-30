package tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.action")
public class FrontController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        Action action = null;
        Action2 action2 = null;

        // Ánh xạ các action
        if ("/subjectmanagement/list.action".equals(path)) {
            action = new subject_management.SubjectListAction();
        } else if ("/subjectmanagement/update.action".equals(path)) {
            action = new subject_management.SubjectUpdateAction();
        } else if ("/subjectmanagement/updateexe.action".equals(path)) {
            action = new subject_management.SubjectUpdateExecuteAction();
        } else if ("/subjectmanagement/create.action".equals(path)) {
            action = new subject_management.SubjectCreateAction();
        } else if ("/subjectmanagement/createexe.action".equals(path)) {
            action = new subject_management.SubjectCreateExecuteAction();
        } else if ("/subjectmanagement/delete.action".equals(path)) {
            action2 = new subject_management.SubjectDeleteAction();
        } else if ("/subjectmanagement/deleteexe.action".equals(path)) {
            action2 = new subject_management.SubjectDeleteExecuteAction();
        } else if ("/subjectmanagement/regist.action".equals(path)) {
            action2 = new subject_management.TestRegistAction();
        } else if ("/subjectmanagement/registexe.action".equals(path)) {
            action2 = new subject_management.TestRegistExecuteAction();
        } else if ("/studentmanagement/list.action".equals(path)) {
            action2 = new student_management.StudentListAction();
        } else if ("/studentmanagement/create.action".equals(path)) {
            action2 = new student_management.StudentCreateAction();
        } else if ("/studentmanagement/createexe.action".equals(path)) {
            action2 = new student_management.StudentCreateExecuteAction();
        } else if ("/studentmanagement/updateexe.action".equals(path)) {
            action2 = new student_management.StudentUpdateExecuteAction();
        } else if ("/studentmanagement/update.action".equals(path)) {
            action2 = new student_management.StudentUpdateAction();
        } else if ("/testmanagement/studentexe.action".equals(path)) {
            action2 = new test_management.TestListStudentExecuteAction();
        } else if ("/testmanagement/list.action".equals(path)) {
            action2 = new test_management.TestListAction();
        } else if ("/testmanagement/subjectexe.action".equals(path)) {
            action2 = new test_management.TestListSubjectExecuteAction();
        } else if ("/login/login.action".equals(path)) {
            action2 = new login.LoginAction();
        } else if ("/login/execute.action".equals(path)) { // Sửa loginexe.action thành execute.action
            action2 = new login.LoginExecuteAction();
        } else if ("/logout/logout.action".equals(path)) {
            action2 = new logout.LogoutAction();
        } else if ("/menu/menuaction.action".equals(path)) { // Sửa menu.action thành menuaction.action
            action2 = new menu.MenuAction();
        }

        // Xử lý yêu cầu
        try {
            String view = null;
            if (action != null) {
                view = action.execute(request, response);
            } else if (action2 != null) {
                view = action2.execute(request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found for: " + path);
                return;
            }

            // Xử lý view
            if (view != null) {
                if (view.startsWith("redirect:")) {
                    String redirectUrl = view.substring("redirect:".length());
                    response.sendRedirect(redirectUrl);
                } else {
                    request.getRequestDispatcher(view).forward(request, response);
                }
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}