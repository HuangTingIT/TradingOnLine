package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.Other.SendEmail;
import TOL.VO.Email;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;

/**
 * Created by HuangTing on 2016/2/24.
 */
public class SendPIN extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        String path="FindCode.jsp";

        List<String> info=new ArrayList<String>();
        HttpSession session = request.getSession();
        Email email=new Email();
        String EmailAddress=request.getParameter("Email");
        email.setEmail(EmailAddress);
        sendEmail(email);
        //path="ValidateCode.jsp";
        session.setAttribute("Email",email);
        response.getWriter().write("true");
        //request.getRequestDispatcher(path).forward(request,response);
    }


    public void sendEmail(Email email){
        String confirmCode=getCode();
        email.setCode(confirmCode);
        if(InsertCode(email)){
            String content="您的验证码是："+confirmCode;
            SendEmail.send(email.getEmail(),content);
        }


    }
    public boolean InsertCode(Email email){
        boolean flag=false;
        if(!emailIsCrated(email)){
            InsertEmail(email);
            System.out.println("插入email "+email.getEmail()+"  email code  "+email.getCode());
        }
        //if(email.getCode()!=null||!(email.getCode().equals(""))){}
        try{
            flag= DAOFactory.getIEamilDAOInstance().InsertCode(email);
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
    public boolean emailIsCrated(Email email){
        boolean emailIsCreated=false;
        try{
            emailIsCreated=DAOFactory.getIEamilDAOInstance().findEmail(email);
        }catch(Exception e){
            e.printStackTrace();
        }
        return emailIsCreated;
    }
    public boolean InsertEmail(Email email){
        boolean emailIsCreated=false;
        if(!emailIsCreated){
            try{
                emailIsCreated=DAOFactory.getIEamilDAOInstance().doInsertEmail(email);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return emailIsCreated;
    }
    public String getCode(){
        Random rad=new Random();

        String result  = rad.nextInt(1000000) +"";

        if(result.length()!=6){
            return getCode();
        }
        return result;
    }
}
