package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Goods;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by HuangTing on 2015/12/13.
 */
public class ShowMyGoods extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        response.setCharacterEncoding("GBK");
        HttpSession session=request.getSession();
        String path="showMyGoods.jsp";
        String UserId=((User)session.getAttribute("User")).getUserId();
        ArrayList<Goods> goodsList=new ArrayList<Goods>();
        try{
            DAOFactory.getIGoodsDAOInstance().findGoodsByUserId(goodsList,UserId);
            System.out.println("找到了我发布的商品");
        }catch (Exception e){
            e.printStackTrace();
        }
        session.setAttribute("GoodsList",goodsList);
        request.getRequestDispatcher(path).forward(request,response);
    }
}
