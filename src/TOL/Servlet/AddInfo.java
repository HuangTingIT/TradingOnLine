package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.Other.IpTimeStamp;
import TOL.VO.User;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.InetAddress;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import com.jspsmart.upload.*;

/**
 * Created by HuangTing on 2015/12/8.
 */
public class AddInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path="showUserInfo.jsp";
        response.setCharacterEncoding("GBK");
        List<String> info=new ArrayList<String>();
        HttpSession session=request.getSession();
        if(session.getAttribute("User")==null){
            path="login.jsp";
        }else{
            User user=(User)session.getAttribute("User");

            //ͷ���ϴ�����
            try {
                SmartUpload smart = new SmartUpload();
                JspFactory _jspxFactory = null;
                PageContext pageContext = null;
                _jspxFactory = JspFactory.getDefaultFactory();
                pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);

                smart.initialize(pageContext);//��ʼ���ϴ�����
                smart.upload();
                IpTimeStamp its=new IpTimeStamp(InetAddress.getLocalHost().getHostAddress());//request.getRemoteAddr()����û���ip��ַ
                user.setNickName(smart.getRequest().getParameter("NickName"));
                user.setRealName(smart.getRequest().getParameter("RealName"));//�û���
                user.setEmail(smart.getRequest().getParameter("Email"));
                user.setTelePhone(smart.getRequest().getParameter("TelePhone"));
                if(((String)smart.getRequest().getParameter("Sex")).equals("Male")){
                    user.setSex("��");
                }else{
                    user.setSex("Ů");
                }
                if(DAOFactory.getIUserDAOInstance().doAddInfo(user)) {
                    info.add("��Ϣ���Ƴɹ�" + user.getRealName() + "����");
                }else{
                    info.add("��Ϣ����ʧ��");
                }
                //���Ҫʵ���ļ��������ϴ�����ֻ����forѭ������getFile(0)�е�0��Ϊi����
                if(smart.getFiles()!=null&&smart.getFiles().getFile(0).getSize()!=0){
                    String ext = smart.getFiles().getFile(0).getFileExt();//��Ϊ�õ��ļ�����չ��,getFile(0)Ϊ�õ�Ψһ��һ���ϴ��ļ�
                    int fileSize=smart.getFiles().getFile(0).getSize();
                    String fileName = its.getIpTimeRand() + "." + ext;
                    System.out.println("��ȡ ���ļ���Ϊ"+fileName);
                    String filePath=getServletContext().getRealPath("/")+"upload"+ java.io.File.separator + fileName;
                    smart.getFiles().getFile(0).saveAs(filePath);
                    java.io.File file = new java.io.File(filePath);//��������д  Ҫ����smartupload���г�ͻ
                    FileInputStream fis = new FileInputStream(file);
                    InputStreamReader isr = new InputStreamReader(
                            new FileInputStream(file));
                    byte[] b=new byte[fis.available()];
                    fis.read(b);
                    user.setIcon(b);
                    session.setAttribute("User",user);
                    fis.close();
                    FileInputStream fis2 = new FileInputStream(file);
                    DAOFactory.getIUserDAOInstance().doInsertPic(user,fis2,fileSize);
                }

                //����ǰ���form���Ѿ������˷�װ������Ͳ��ܼ򵥵���request.getparameter()����ȡ������


            }catch(Exception e){
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }
}
