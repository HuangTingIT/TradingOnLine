package TOL.DAO;

import TOL.VO.Goods;
import java.sql.*;
import java.util.*;


/**
 * Created by Satan on 2015/12/21.
 */
public class SearchGoods_Dao
{
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    public SearchGoods_Dao(Connection conn)
    {
        this.conn = conn;
    }
    public List<Goods> getBySearch(String keyword) throws Exception
    {
        List<Goods> list = new ArrayList<Goods>();
        String search_sql = "SELECT * FROM GoodsInfo WHERE CATEGORY LIKE ? OR NAME LIKE ?";
        this.pstmt = conn.prepareStatement(search_sql);
        System.out.println("keyword: "+keyword);
        this.pstmt.setString(1, "%"+keyword+"%");
        this.pstmt.setString(2, "%"+keyword+"%");
        ResultSet rs = pstmt.executeQuery();
        Goods  goods= null;
        while(rs.next()) {
            goods = new Goods();
            goods.setGoodsID(rs.getString(1));
            goods.setUserId(rs.getString(2));
            goods.setName(rs.getString(3));
            goods.setCategory(rs.getString(4));
            goods.setNum(rs.getInt(5));
            goods.setPrice(rs.getFloat(6));
            goods.setDescription(rs.getString(7));
            goods.setPictures(rs.getString(8));
            goods.setAddress(rs.getString(9));
            goods.setView_num(rs.getInt(10));
            list.add(goods);
        }
        this.pstmt.close();
        return list;
    }
}
