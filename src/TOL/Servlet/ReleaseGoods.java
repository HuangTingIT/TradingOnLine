package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Goods;
import TOL.VO.User;
import com.jspsmart.upload.SmartUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspFactory;
import javax.servlet.jsp.PageContext;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by HuangTing on 2015/12/11.
 */
public class ReleaseGoods extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        response.setCharacterEncoding("GBK");
        boolean judge = true;
        String path="index.jsp";
        List<String> info=new ArrayList<String>();
        HttpSession session=request.getSession();
        Goods goods=new Goods();
        try {
            String pictures="";
            int count=0;
            SmartUpload smart = new SmartUpload();
            JspFactory _jspxFactory = null;
            PageContext pageContext = null;
            _jspxFactory = JspFactory.getDefaultFactory();
            pageContext = _jspxFactory.getPageContext(this, request, response, "", true, 8192, true);

            //smart.setAllowedFilesList("jpg,JPG,png");
            smart.initialize(pageContext);//��ʼ���ϴ�����
            smart.upload();
            //��ʼ��Ҫ��������Ʒ��Ϣ
            goods.setUserId(((User)session.getAttribute("User")).getUserId());
            System.out.println(goods.getUserId());
            goods.setName(smart.getRequest().getParameter("name"));
            goods.setCategory(smart.getRequest().getParameter("category"));
            goods.setDescription(smart.getRequest().getParameter("_fm.i._0.de"));
            goods.setView_num(1);
            goods.setAddress(smart.getRequest().getParameter("address"));

            try{
                goods.setNum(Integer.parseInt((smart.getRequest().getParameter("num"))));
                goods.setPrice(Double.parseDouble(smart.getRequest().getParameter("price")));
            }catch(Exception e){
                e.printStackTrace();
            }
            try{
                if(DAOFactory.getIGoodsDAOInstance().doRelease(goods)){
                    info.add("�����Ʒ�ɹ�");
                    System.out.println("�����Ʒ�ɹ�");
                }else{
                    info.add("�����Ʒʧ��");
                    judge=false;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            try{
                if(DAOFactory.getIGoodsDAOInstance().findGoodsByNameAndUserID(goods)){
                    info.add("���ҵ�����ƷID");
                }else{
                    info.add("û�鵽ID");
                    judge=false;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            //�ϴ�ͼƬ���������ͱ����ڷ���������Ҫ������·�����в��� request.getSession().getServletContext().getRealPath("/")�õ�����TradingOnLine��webĿ¼��
            String realPath=request.getSession().getServletContext().getRealPath("/")
                    +File.separator+"GoodsPictures"+
                    File.separator+goods.getUserId();
            System.out.println("realPath "+realPath);
            hasDirectory(realPath);
            //�����ϴ����淢������Ʒ��ͼƬ
            for (int i = 0; i < smart.getFiles().getCount(); i++) {
                count++;
                com.jspsmart.upload.File myFile = smart.getFiles().getFile(i);
                String fileName =goods.getGoodsID()+count+"."+myFile.getFileExt();
                if(pictures.equals("")){
                    pictures=goods.getUserId()+"/"+fileName;
                }else{
                    pictures=pictures+";"+goods.getUserId()+"/"+fileName;
                }
                System.out.println(realPath+File.separator+fileName);
                myFile.saveAs(realPath+File.separator+fileName);
            }
            System.out.println(count + "�ļ����ϴ�");
            goods.setPictures(pictures);
            if(DAOFactory.getIGoodsDAOInstance().doInsertPictures(goods)){
                info.add("ͼƬ����ɹ�");
            }
        }catch(Exception e){
            e.printStackTrace();
            judge=false;
        }
        session.setAttribute("Goods",goods);
        request.setAttribute("info",info);
        if(judge==false) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            request.getRequestDispatcher("release_success.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
    public boolean hasDirectory(String Save_Location){
        boolean flag=false;
        try{
            if (!(new java.io.File(Save_Location).isDirectory())) //����ļ��в�����
            {
                new java.io.File(Save_Location).mkdir();
                System.out.println("�����ļ���");//������ excel �ļ��У��������ļ���
            }
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
