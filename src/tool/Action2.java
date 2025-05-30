package tool;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action2 extends HttpServlet {
    // Phương thức trừu tượng trả về String để chỉ định JSP hoặc URL
    public abstract String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            // Gọi execute và lấy đường dẫn JSP/URL
            String nextPage = execute(req, resp);
            if (nextPage != null) {
                // Xử lý forward hoặc redirect dựa trên giá trị trả về
                if (nextPage.startsWith("redirect:")) {
                    String redirectUrl = nextPage.substring("redirect:".length());
                    resp.sendRedirect(redirectUrl);
                } else {
                    req.getRequestDispatcher(nextPage).forward(req, resp);
                }
            }
        } catch (Exception e) {
            throw new IOException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        // Gọi doGet để xử lý giống nhau cho cả GET và POST
        doGet(req, resp);
    }
}