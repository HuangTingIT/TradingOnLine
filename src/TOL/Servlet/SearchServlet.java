package TOL.Servlet;

import TOL.Factory.DAOFactory;
import TOL.VO.Goods;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.ServletException;
import java.io.IOException;
import java.util.*;
/**
 * Created by Satan on 2015/12/21.
 */
public class SearchServlet extends HttpServlet
{
    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("this is doGet!");
    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("GBK");
        String s = req.getParameter("keyword");
        if (s == null)
        {
            s = "";
        }
        System.out.println("s: "+s);
        try
        {
            List<Goods> list;
            list = DAOFactory.getSearchDaoProxy().getBySearch(s);
            req.getSession().setAttribute("GoodsList",list);
            req.getRequestDispatcher("product.jsp").forward(req,resp);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
