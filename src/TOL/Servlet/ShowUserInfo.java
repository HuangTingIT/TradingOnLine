package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.Other.IpTimeStamp;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HuangTing on 2015/12/10.
 */
public class ShowUserInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> info=new ArrayList<String>();
        User user=(User)request.getSession().getAttribute("User");
        try{
            if(DAOFactory.getIUserDAOInstance().findUserInfo(user,0,0)){
                info.add("�鿴��Ϣ�ɹ�" + user.getRealName() + "����");
            }else{
                info.add("�鿴��Ϣʧ��");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        IpTimeStamp its=new IpTimeStamp(InetAddress.getLocalHost().getHostAddress());//request.getRemoteAddr()����û���ip��ַ
        System.out.println("��ȡ��ipΪ"+InetAddress.getLocalHost().getHostAddress());
        request.setAttribute("info",info);
        request.getRequestDispatcher("showUserInfo.jsp").forward(request,response);
    }
}
