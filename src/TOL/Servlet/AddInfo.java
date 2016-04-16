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

            //头像上传操作
            try {
                SmartUpload smart = new SmartUpload();
                JspFactory _jspxFactory = null;
                PageContext pageContext = null;
                _jspxFactory = JspFactory.getDefaultFactory();
                pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);

                smart.initialize(pageContext);//初始化上传操作
                smart.upload();
                IpTimeStamp its=new IpTimeStamp(InetAddress.getLocalHost().getHostAddress());//request.getRemoteAddr()获得用户的ip地址
                user.setNickName(smart.getRequest().getParameter("NickName"));
                user.setRealName(smart.getRequest().getParameter("RealName"));//用户名
                user.setEmail(smart.getRequest().getParameter("Email"));
                user.setTelePhone(smart.getRequest().getParameter("TelePhone"));
                if(((String)smart.getRequest().getParameter("Sex")).equals("Male")){
                    user.setSex("男");
                }else{
                    user.setSex("女");
                }
                if(DAOFactory.getIUserDAOInstance().doAddInfo(user)) {
                    info.add("信息完善成功" + user.getRealName() + "光临");
                }else{
                    info.add("信息完善失败");
                }
                //如果要实现文件的批量上传，则只需用for循环，将getFile(0)中的0改为i即可
                if(smart.getFiles()!=null&&smart.getFiles().getFile(0).getSize()!=0){
                    String ext = smart.getFiles().getFile(0).getFileExt();//此为得到文件的扩展名,getFile(0)为得到唯一的一个上传文件
                    int fileSize=smart.getFiles().getFile(0).getSize();
                    String fileName = its.getIpTimeRand() + "." + ext;
                    System.out.println("获取 的文件名为"+fileName);
                    String filePath=getServletContext().getRealPath("/")+"upload"+ java.io.File.separator + fileName;
                    smart.getFiles().getFile(0).saveAs(filePath);
                    java.io.File file = new java.io.File(filePath);//必须这样写  要不和smartupload的有冲突
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

                //由于前面的form表单已经进行了封装，这里就不能简单的用request.getparameter()来获取表单参数


            }catch(Exception e){
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher(path).forward(request,response);
    }
}
