package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Goods;
import TOL.VO.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by HuangTing on 2016/1/8.
 */
public class CheckOutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("GBK");
        response.setCharacterEncoding("GBK");
        HttpSession session=request.getSession();
        String path="checkout.jsp";
        String UserId=((User)session.getAttribute("User")).getUserId();
        //ArrayList<String> goodsListNum=new ArrayList<String>();
        ArrayList<Goods> goodsListNum = new ArrayList<Goods>();
        try{
            DAOFactory.getAddGoodsDaoProxy().searchGoods(goodsListNum,UserId);
        }catch (Exception e){
            e.printStackTrace();
        }
        ArrayList<Goods> goodsList=new ArrayList<Goods>();

        for(int i=0;i<goodsListNum.size();i++){
            Goods temp=new Goods();
            temp.setTime(goodsListNum.get(i).getTime());
            try{
                DAOFactory.getIGoodsDAOInstance().findGoodsByGoodsId(temp,goodsListNum.get(i).getGoodsID());
                goodsList.add(temp);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        session.setAttribute("GoodsList",goodsList);
        request.getRequestDispatcher(path).forward(request,response);
    }
}
