package TOL.Servlet;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.Factory.DAOFactory;
import TOL.VO.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;

public class AddInfoTelJudge extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("This is doGet!");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String Tel = req.getParameter("telePhone");
        User user = (User) req.getSession().getAttribute("User");
        boolean judge = false;
        System.out.println("Tel: "+Tel+" User："+user.getUserId());
        try {
            judge = DAOFactory.getAddInfoTelDaoProxy().judgeTel(Tel, user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.getWriter().write(String.valueOf(judge));
    }
}
