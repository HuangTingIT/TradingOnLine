package TOL.Servlet;

/**
 * Created by Satan on 2016/2/18.
 */
import TOL.Factory.DAOFactory;
import TOL.VO.User;
import TOL.VO.Goods;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
public class ShoppingDeleteServlet extends HttpServlet {
    public void doGet(HttpServletRequest req, HttpServletResponse resp){
        String goodsid = req.getParameter("goodsid");
        String loginUserId = req.getParameter("loginUserId");
        String IDs[] = goodsid.split(",");
        try
        {
            List<Goods> list = new ArrayList<Goods>();;
            list = DAOFactory.getDeleteFromCarProxy().delete(IDs,loginUserId);
            req.getSession().setAttribute("GoodsList",list);
            req.getRequestDispatcher("checkout.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void doPost(HttpServletRequest req, HttpServletResponse resp){
        System.out.println("This is doPost");
    }
}
