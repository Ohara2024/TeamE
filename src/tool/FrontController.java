package tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {


    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        processRequest(request, response);
    }


    private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String path = request.getServletPath();


        if ("/TestListAction".equals(path)) {

            TestListAction action = new TestListAction();
            action.execute(request, response);
        } else if ("/otherAction".equals(path)) {

        } else {

            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Action not found");
        }
    }


    @Override
    public void destroy() {

    }
}
