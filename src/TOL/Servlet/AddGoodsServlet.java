package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Goods;
import TOL.VO.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;
/**
 * Created by Satan on 2015/12/21.
 */
public class AddGoodsServlet extends HttpServlet
{
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
    {
        System.out.println("This is doGet!");
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws UnsupportedEncodingException {
        req.setCharacterEncoding("GBK");
        Goods goods = new Goods();
        String UserId=((User)req.getSession().getAttribute("User")).getUserId();
        goods.setGoodsID(req.getParameter("goodsid"));
        goods.setUserId(req.getParameter("userid"));
        goods.setTime(req.getParameter("time"));
        try
        {
            boolean judge_add;
            judge_add =  DAOFactory.getAddGoodsDaoProxy().addGoods(goods,UserId);
            req.setAttribute("judge_addGoods", judge_add);
            req.setAttribute("goodsId",goods.getGoodsID());
            req.getRequestDispatcher("single.jsp").forward(req,resp);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}
