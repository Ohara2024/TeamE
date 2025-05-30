package subject_management;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tool.Action2;

public class SubjectDeleteAction extends Action2 {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String cd = request.getParameter("cd");
        String name = request.getParameter("name");

        request.setAttribute("cd", cd);
        request.setAttribute("name", name);

        // Trả về đường dẫn JSP để Action2 forward
        return "/subjectmanagement/subject_delete.jsp";
    }
}