package TOL.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by HuangTing on 2015/12/21.
 */
@WebServlet(name = "Logout")
public class Logout extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path="index.jsp";
        ArrayList<String> info=new ArrayList<String>();
        if(request.getSession().getAttribute("User")!=null){
            request.getSession().removeAttribute("User");
            info.add("退出成功");
        }
        request.getRequestDispatcher(path).forward(request,response);
    }
}
