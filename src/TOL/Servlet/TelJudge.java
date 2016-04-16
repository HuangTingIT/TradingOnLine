package TOL.Servlet;

/**
 * Created by Satan on 2016/2/20.
 */
import TOL.Factory.DAOFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;

public class TelJudge extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("This is doGet");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Tel = req.getParameter("Tel");
        System.out.println("Tel: "+Tel);
        boolean judge = false;
        try {
            judge = DAOFactory.getJudgeTelDaoProxy().judgeTel(Tel); //可以注册返回真，不可以注册返回假
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.getWriter().write(String.valueOf(judge));
    }
}
