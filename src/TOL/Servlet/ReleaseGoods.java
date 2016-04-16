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
            smart.initialize(pageContext);//初始化上传操作
            smart.upload();
            //初始化要发布的商品信息
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
                    info.add("添加商品成功");
                    System.out.println("添加商品成功");
                }else{
                    info.add("添加商品失败");
                    judge=false;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            try{
                if(DAOFactory.getIGoodsDAOInstance().findGoodsByNameAndUserID(goods)){
                    info.add("查找到该商品ID");
                }else{
                    info.add("没查到ID");
                    judge=false;
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            //上传图片到服务器和保存在服务器上需要对真是路径进行操作 request.getSession().getServletContext().getRealPath("/")得到的是TradingOnLine的web目录下
            String realPath=request.getSession().getServletContext().getRealPath("/")
                    +File.separator+"GoodsPictures"+
                    File.separator+goods.getUserId();
            System.out.println("realPath "+realPath);
            hasDirectory(realPath);
            //依次上传保存发布的商品的图片
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
            System.out.println(count + "文件已上传");
            goods.setPictures(pictures);
            if(DAOFactory.getIGoodsDAOInstance().doInsertPictures(goods)){
                info.add("图片保存成功");
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
            if (!(new java.io.File(Save_Location).isDirectory())) //如果文件夹不存在
            {
                new java.io.File(Save_Location).mkdir();
                System.out.println("创建文件夹");//不存在 excel 文件夹，则建立此文件夹
            }
            flag=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return flag;
    }
}
