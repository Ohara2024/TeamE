package tool;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FrontController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doPost(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            String path = req.getServletPath().substring(1).replace(".action", "");
            String className = "scoremanager." + path;

            tool.Action action = (tool.Action) Class.forName(className).getDeclaredConstructor().newInstance();
            String nextPage = action.execute(req, res);

            if (nextPage != null) {
                if (nextPage.endsWith(".action")) {
                    res.sendRedirect(nextPage); // 成功時など
                } else {
                    RequestDispatcher dispatcher = req.getRequestDispatcher(nextPage);
                    dispatcher.forward(req, res); // JSP にフォワード
                }
            }

        } catch (Exception e) {
            req.setAttribute("error", "システムエラーが発生しました。");
            req.getRequestDispatcher("error.jsp").forward(req, res);
        }
    }
}
