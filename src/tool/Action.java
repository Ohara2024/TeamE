package tool;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action {
    public abstract void execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}

