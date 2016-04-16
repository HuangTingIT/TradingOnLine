package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Email;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by HuangTing on 2016/2/29.
 */
@WebServlet(name = "ChangeThePassWord")
public class ChangeThePassWord extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        String path="login.jsp";
        String newPW=request.getParameter("FirstPW");
        if(session.getAttribute("Email")!=null){
            Email email=(Email)session.getAttribute("Email");
            User user=findUserByEmail(email);
            user.setPassWord(newPW);
            if(!changeThePW(user)){
                response.getWriter().write("false");
            }
        }else{
            response.getWriter().write("false");
        }
        //request.getRequestDispatcher(path).forward(request,response);
    }
    public User findUserByEmail(Email email){
        User user=new User();
        user.setEmail(email.getEmail());
        try{
            DAOFactory.getIUserDAOInstance().findLoginByEmail(user);
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    public boolean changeThePW(User user){
        boolean flag=false;
        try{
            flag=DAOFactory.getIUserDAOInstance().changePassWord(user);
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
