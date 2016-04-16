package TOL.DAO;

import TOL.VO.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Satan on 2015/12/21.
 */
public class AddGoods_Dao {
    private Connection conn = null;
    private PreparedStatement pstmt = null;

    public AddGoods_Dao(Connection conn) {
        this.conn = conn;
    }

    public boolean judgecar(String customerid, Goods goods) throws SQLException //判断加入购物车的动作是否合法，即是否该商品时自己发布的
    {
        if(customerid.equals(goods.getUserId())==true) //自己不能添加自己发布的商品进购物车
        {
            return false;
        }
        String sql = "SELECT * FROM SHOPPINGCAR WHERE USERID=? and GOODSID=?";
        PreparedStatement ps = null;
        ps = conn.prepareStatement(sql);
        ps.setString(1, customerid);
        ps.setString(2, goods.getGoodsID());
        ResultSet rs = null;
        rs = ps.executeQuery();
        if(rs!=null&&rs.next()==true) //说明此商品已经添加过了，不能重复添加
        {
            rs.close();
            ps.close();
            return false;
        }
        rs.close();
        ps.close();
        return true;
    }
    public boolean addGoods(Goods goods,String UserId) throws Exception {
        boolean judge = judgecar(UserId, goods);
        if(judge==true)
        {
            String sql = "INSERT INTO SHOPPINGCAR (USERID,GOODSID,Time) VALUES(?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, UserId);
            pstmt.setString(2, goods.getGoodsID());
            pstmt.setString(3, goods.getTime());
            int count = 0;
            count = pstmt.executeUpdate();
            conn.commit();
            if (count == 0) {
                return false;
            } else {
                return true;
            }
        }
        else
        {
            return false;
        }
    }
    public boolean searchGoods(ArrayList<Goods> goodsListNum,String UserId) throws Exception {
        boolean flag=false;
        String sql = "SELECT GOODSID,time FROM shoppingcar WHERE USERID=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, UserId);
        ResultSet rs= this.pstmt.executeQuery();
        Goods goods = null;
        while(rs.next()) {
            goods = new Goods();
            goods.setGoodsID(rs.getString(1));
            goods.setTime(rs.getString(2));
            goodsListNum.add(goods);
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
}
