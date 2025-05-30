

package menu;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.School;
import dao.SchoolDao;

@WebServlet(urlPatterns = {"/menu/menuaction"})

public class MenuAction extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public MenuAction() {

        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        try {

            // 学校情報を取得してセッションにセット

            SchoolDao dao = new SchoolDao();

            School school = dao.get("oom"); // 学校コードはデータベースに合わせてください

            request.getSession().setAttribute("school", school);

            // メニューに進む

            request.getRequestDispatcher("/main/menu.jsp").forward(request, response);

        } catch (Exception e) {

            throw new ServletException(e);

        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)

            throws ServletException, IOException {

        doGet(request, response);

    }

}

