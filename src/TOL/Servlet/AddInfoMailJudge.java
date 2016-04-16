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
public class AddInfoMailJudge extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("This is doGet");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mail = req.getParameter("mail");
        User user = null;
        if(req.getSession().getAttribute("User")!=null){
            user = (User) req.getSession().getAttribute("User");
        }else{
            user = new User();
            user.setUserId("-1");
        }
        boolean judge = false;
        try {
            judge = DAOFactory.getAddInfoMailDaoProxy().judgeMail(mail, user.getUserId());
        } catch (Exception e) {
            e.printStackTrace();
        }
        resp.getWriter().write(String.valueOf(judge));
    }
}
