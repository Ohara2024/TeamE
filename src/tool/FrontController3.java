package tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.action")
public class FrontController3 extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        Action action = null;
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
        }{
        }
        // 必要に応じて他のActionも追加してください

        if (action == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found for: " + path);
            return;
        }

        try {
            String view = action.execute(request, response);

            // viewがnullの場合はリダイレクト済みなのでforwardしない
            if (view != null) {
                request.getRequestDispatcher(view).forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}

