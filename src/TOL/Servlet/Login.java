package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HuangTing on 2015/12/8.
 */
//@WebServlet(name = "/LoginServlet")
public class Login extends HttpServlet {
    public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        req.setCharacterEncoding("GBK");
        String path="index.jsp";
        List<String> info=new ArrayList<String>();
        HttpSession session = req.getSession();
        if(session.getAttribute("User")==null){//还没有登录
            String telePhone=req.getParameter("telePhone");
            String userPassWord=req.getParameter("userPassWord");
            User user=new User();
            user.setTelePhone(telePhone);
            user.setPassWord(userPassWord);
            try{
                if(DAOFactory.getIUserDAOInstance().findLoginByTel(user)) {
                    path="login_success.jsp";
                    session.setAttribute("User", user);
                }else {
                    info.add("false");
                    req.setAttribute("info",info);
                    req.getRequestDispatcher("login.jsp").forward(req,resp);
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            info.add("您已登陆，无需重复登陆");
            path="index.jsp";
        }

        req.setAttribute("info",info);
        req.getRequestDispatcher(path).forward(req,resp);
    }
    public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        this.doGet(req,resp);
    }
}
