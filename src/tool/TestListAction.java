package tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class TestListAction extends Action2 {
    @Override
    public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
        // Lấy session
        HttpSession session = req.getSession();

        // Giả định lấy thông tin từ session hoặc tham số (có thể tùy chỉnh)
        String errorMessage = (String) session.getAttribute("errorMessage");
        if (errorMessage != null) {
            req.setAttribute("errorMessage", errorMessage);
            session.removeAttribute("errorMessage"); // Xóa thông báo sau khi sử dụng
        }

        // Giả định trả về JSP mặc định cho danh sách kiểm tra
        return "/test_management/test_list.jsp";
    }
}