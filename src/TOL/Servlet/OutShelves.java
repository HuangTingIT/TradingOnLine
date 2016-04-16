package TOL.Servlet;

/**
 * Created by Satan on 2016/2/20.
 */
import TOL.Factory.DAOFactory;
import TOL.VO.Goods;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class OutShelves extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userid = req.getParameter("userid");
        String goodsid = req.getParameter("goodsid");
        List<Goods> list = new ArrayList<Goods>();
        ServletContext servletContext = this.getServletContext();
        try {
            list = DAOFactory.getOutShelvesDaoProxy().Out(userid, goodsid,servletContext);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getSession().setAttribute("GoodsList",list);
        req.getRequestDispatcher("showMyGoods.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("This is doPost!");
    }
}
