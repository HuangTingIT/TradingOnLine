package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Email;

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
public class CheckTheCode extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path="ChangePassWord.jsp";
        String code=request.getParameter("Code");
        HttpSession session=request.getSession();
        if(session.getAttribute("Email")!=null){
            Email email=(Email)session.getAttribute("Email");
            if(!ValidateCode(email,code)){
                response.getWriter().write("false");
            }else{
                response.getWriter().write("true");
            }
        }else{
            response.getWriter().write("false");
        }
    }
    public boolean ValidateCode(Email email,String code){
        if(hasEmailCode(email)){
            if(email.getCode().equals(code)){
                return true;
            }else{
                return false;
            }
        }
        else{
                return false;
            }
    }
    public boolean hasEmailCode(Email email){
        boolean flag=true;
        try{
            flag= DAOFactory.getIEamilDAOInstance().findCode(email);
        }catch(Exception e){
            e.printStackTrace();
        }
        if(flag&&(email.getCode()!=null||(!email.getCode().equals("")))){
            return true;
        }else{
            return false;
        }
    }
}
