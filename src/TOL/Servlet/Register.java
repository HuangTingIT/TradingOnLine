package TOL.Servlet;

import TOL.VO.User;
import TOL.Factory.DAOFactory;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HuangTing on 2015/12/8.
 */
//@WebServlet(name = "/RegisterServlet")
public class Register extends HttpServlet {
    public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        //register.jsp��������
        String path="index.jsp";
        List<String> info=new ArrayList<String>();
        if(req.getSession().getAttribute("User")==null){

            String userTelePhone=req.getParameter("userTelePhone");
            String userPassWord=req.getParameter("userPassWord");
            String userRealName=req.getParameter("userRealName");
            String userEmail=req.getParameter("email");
            User user=new User();
            user.setTelePhone(userTelePhone);
            user.setPassWord(userPassWord);
            user.setRealName(userRealName);
            user.setEmail(userEmail);
            try{
                if(DAOFactory.getIUserDAOInstance().doRegister(user)) {
                    /*info.add("�û�ע��ɹ������ѵ�¼����ӭ����");
                    req.getSession().setAttribute("User",user);
                    req.setAttribute("info",info);*/
                    req.getRequestDispatcher("register_success.jsp").forward(req,resp);
                }
                else {
                    info.add("�û�ע��ʧ��");
                    req.getSession().setAttribute("User",user);
                    req.setAttribute("info",info);
                    req.getRequestDispatcher(path).forward(req,resp);
                }
            }catch(Exception e){
                e.printStackTrace();
            }

        }else{
            info.add("�ѵ�½ ����ע��");
            req.getRequestDispatcher(path).forward(req,resp);
        }
    }
    public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
        this.doGet(req,resp);
    }
}
