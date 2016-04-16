package TOL.DAO;

/**
 * Created by Satan on 2016/2/18.
 */
import TOL.VO.Goods;
import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;

import java.sql.*;
import java.util.*;

public class DeleteFromCarDao {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private Statement stmt = null;
    public DeleteFromCarDao(Connection conn){
        this.conn=conn;
    }
    public List<Goods> delete(String[] goodsid, String userid) throws SQLException {
        String part1 = "DELETE FROM SHOPPINGCAR WHERE USERID="+userid+" AND GOODSID=";
        stmt = conn.createStatement();
        for(int i=0;i<goodsid.length;i++){
            stmt.addBatch(part1+goodsid[i]);
        }
        int count[] = stmt.executeBatch();
        conn.commit();
        stmt.close();

        String sql2 = "SELECT GOODSID FROM SHOPPINGCAR WHERE USERID=?";
        List<String> goodslist = new ArrayList<String>();
        pstmt = conn.prepareStatement(sql2);
        this.pstmt.setString(1,userid);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            goodslist.add(rs.getString(1));
        }
        pstmt.close();

        List<Goods> list = new ArrayList<Goods>();
        if(goodslist.size()>0){
            String sql3 = "SELECT * FROM GoodsInfo WHERE GOODSID=";
            String s = "";
            for(int i=0;i<goodslist.size();i++){
                if(i>0){
                    s = s+" or GOODSID=";
                }
                s = s+goodslist.get(i);
            }
            sql3 = sql3+s;
            Statement st = conn.createStatement();
            ResultSet rs2 = st.executeQuery(sql3);
            Goods goods = null;
            while(rs2.next()){
                goods = new Goods();
                goods.setGoodsID(rs2.getString(1));
                goods.setUserId(rs2.getString(2));
                goods.setName(rs2.getString(3));
                goods.setCategory(rs2.getString(4));
                goods.setNum(rs2.getInt(5));
                goods.setPrice(rs2.getFloat(6));
                goods.setDescription(rs2.getString(7));
                goods.setPictures(rs2.getString(8));
                goods.setAddress(rs2.getString(9));
                goods.setView_num(rs2.getInt(10));
                list.add(goods);
            }
            pstmt.close();
        }
        return list;
    }
}
