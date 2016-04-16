package TOL.DAO;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.VO.Goods;

import javax.servlet.ServletContext;
import java.io.File;
import java.sql.*;
import java.util.*;

public class OutShelvesDao {
    private Connection conn;
    private PreparedStatement pstmt0;
    private PreparedStatement pstmt1;
    private PreparedStatement pstmt2;
    private PreparedStatement pstmt3;
    public OutShelvesDao(Connection conn){
        this.conn = conn;
    }
    public List<Goods> Out(String userid, String goodsid, ServletContext servletContext) throws SQLException {
        boolean judge = true;
        List<Goods> list = new ArrayList<Goods>();
        String PicList[] = new String[0];
        //List<String> PicList = new ArrayList<String>();
        String sql0 = "SELECT PICTURES FROM GOODSINFO WHERE GOODSID=?"; //删除本地图片
        String sql1 = "DELETE FROM GOODSINFO WHERE GOODSID=?"; //在商品中删除goodsid相符的商品
        String sql2 = "DELETE FROM SHOPPINGCAR WHERE GOODSID=?"; //在所有人的购物车中删除此商品
        String sql3 = "SELECT * FROM GOODSINFO WHERE USERID=?"; //在商品中查找userid相符即是此人所发布的商品

        pstmt0 = conn.prepareStatement(sql0);
        pstmt0.setString(1, goodsid);
        ResultSet rs0 = pstmt0.executeQuery();
        while(rs0.next()){
            PicList = rs0.getString(1).split(";");
        }

        pstmt1 = conn.prepareStatement(sql1);
        pstmt1.setString(1, goodsid);
        int count1 = pstmt1.executeUpdate();
        conn.commit();

        pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setString(1, goodsid);
        int count2 = pstmt2.executeUpdate();
        conn.commit();

        pstmt3 = conn.prepareStatement(sql3);
        pstmt3.setString(1, userid);
        ResultSet rs = pstmt3.executeQuery();
        Goods goods = null;
        while(rs.next()){
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

        for(int i = 0;i<PicList.length;i++){ //删除保存在服务器中的图片，避免遗留产生垃圾
            String realPath = "";
            realPath = servletContext.getRealPath("GoodsPictures/"+PicList[i]);
            System.out.println("realPath: "+realPath);
            File f = new File(realPath);
            boolean judgeDel = f.delete();
            if(judgeDel==true){
                System.out.println("D:/程序/Web/TradingOnLine/web/GoodsPictures/"+PicList[i]+" has been deleted");
            }
        }
        rs.close();
        pstmt1.close();
        pstmt2.close();
        pstmt3.close();
        return list;
    }
}
