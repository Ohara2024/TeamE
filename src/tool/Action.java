package tool;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
    // Actionごとに処理を行い、画面遷移先のJSPやURLを返す
    String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
