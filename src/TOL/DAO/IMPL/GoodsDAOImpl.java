package TOL.DAO.IMPL;

import TOL.DAO.IGoodsDAO;
import TOL.VO.Goods;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 * Created by HuangTing on 2015/12/11.
 */
public class GoodsDAOImpl implements IGoodsDAO{
    private Connection conn=null;
    private PreparedStatement pstmt=null;
    public GoodsDAOImpl(Connection conn){
        this.conn=conn;
    }

    public boolean doRelease(Goods goods)throws Exception{
        boolean flag=false;
        String sql = "INSERT INTO GoodsInfo (GoodsId, UserId,Name,Category ,Num,Price,Description,Address) " +
                "VALUES(GOODS_ID.NEXTVAL,?,?,?,?,?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, goods.getUserId());
        this.pstmt.setString(2, goods.getName());
        this.pstmt.setString(3, goods.getCategory());
        this.pstmt.setInt(4,goods.getNum());
        this.pstmt.setDouble(5,goods.getPrice());
        this.pstmt.setString(6,goods.getDescription());
        this.pstmt.setString(7,goods.getAddress());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean findGoodsByName(ArrayList<Goods> goodsList,String name)throws Exception{
        boolean flag=false;
        String sql = "SELECT GoodsId, UserId,Name,Category ,Num,Price,Description,Address,View_Num,Pictures FROM GoodsInfo WHERE Name=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, name);
        ResultSet rs= this.pstmt.executeQuery();

        while(rs.next()) {
            Goods goods=new Goods();
            goods.setGoodsID(rs.getString(1));
            goods.setUserId(rs.getString(2));
            goods.setName(rs.getString(3));
            goods.setCategory(rs.getString(4));
            goods.setNum(rs.getInt(5));
            goods.setPrice(rs.getDouble(6));
            goods.setDescription(rs.getString(7));
            goods.setAddress(rs.getString(8));
            goods.setView_num(rs.getInt(9));
            goods.setPictures(rs.getString(10));
            goodsList.add(goods);
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean findGoodsByUserId(ArrayList<Goods> goodsList,String UserId)throws Exception{
        boolean flag=false;
        String sql = "SELECT GoodsId, UserId,Name,Category ,Num,Price,Description,Address,View_Num,Pictures FROM GoodsInfo WHERE UserId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, UserId);
        ResultSet rs= this.pstmt.executeQuery();

        while(rs.next()) {
            Goods goods=new Goods();
            goods.setGoodsID(rs.getString(1));
            goods.setUserId(rs.getString(2));
            goods.setName(rs.getString(3));
            goods.setCategory(rs.getString(4));
            goods.setNum(rs.getInt(5));
            goods.setPrice(rs.getDouble(6));
            goods.setDescription(rs.getString(7));
            goods.setAddress(rs.getString(8));
            goods.setView_num(rs.getInt(9));
            goods.setPictures(rs.getString(10));
            goodsList.add(goods);
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean findGoodsByNameAndUserID(Goods goods)throws Exception{
        boolean flag=false;
        String sql = "SELECT GoodsId,Name,Category ,Num,Price,Description,Address,View_Num ,Pictures FROM GoodsInfo WHERE Name=? AND UserID=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, goods.getName());
        this.pstmt.setString(2,goods.getUserId());
        ResultSet rs= this.pstmt.executeQuery();
        if(rs.next()) {
            goods.setGoodsID(rs.getString(1));
            goods.setName(rs.getString(2));
            goods.setCategory(rs.getString(3));
            goods.setNum(rs.getInt(4));
            goods.setPrice(rs.getDouble(5));
            goods.setDescription(rs.getString(6));
            goods.setAddress(rs.getString(7));
            goods.setView_num(rs.getInt(8));
            goods.setPictures(rs.getString(9));
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean doInsertPictures(Goods goods)throws Exception{
        boolean flag=false;
        String sql = "UPDATE GoodsInfo set Pictures=? WHERE GoodsId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, goods.getPictures());
        this.pstmt.setString(2, goods.getGoodsID());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean doReEdit(Goods goods)throws Exception{
        boolean flag=false;
        String sql = "UPDATE GoodsInfo set Name=?,Category=? ,Num=?,Price=?," +
                "Description=? ,Address=?,View_Num=?,Pictures=? WHERE GoodsId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, goods.getName());
        this.pstmt.setString(2, goods.getCategory());
        this.pstmt.setInt(3,goods.getNum());
        this.pstmt.setDouble(4,goods.getPrice());
        this.pstmt.setString(5,goods.getDescription());
        this.pstmt.setString(6,goods.getAddress());
        this.pstmt.setInt(7,goods.getView_num());
        this.pstmt.setString(8,goods.getPictures());
        this.pstmt.setString(9,goods.getGoodsID());

        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }

    public boolean findGoodsByGoodsId(Goods goods,String goodsId)throws Exception{
        boolean flag=false;
        String sql = "SELECT  UserId,Name,Category ,Num,Price,Description,Address,View_Num,Pictures FROM GoodsInfo WHERE goodsId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, goodsId);
        ResultSet rs= this.pstmt.executeQuery();

        while(rs.next()) {
            goods.setUserId(rs.getString(1));
            goods.setName(rs.getString(2));
            goods.setCategory(rs.getString(3));
            goods.setNum(rs.getInt(4));
            goods.setPrice(rs.getDouble(5));
            goods.setDescription(rs.getString(6));
            goods.setAddress(rs.getString(7));
            goods.setView_num(rs.getInt(8));
            goods.setPictures(rs.getString(9));
            goods.setGoodsID(goodsId);
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean doDelete(Goods goods)throws Exception{
        boolean flag=false;
        String sql = "DELETE FROM GoodsInfo WHERE GoodsId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1,goods.getGoodsID());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    //public boolean findgoodsInfo(Goods goods)throws Exception{}
    public boolean findAllGoods(ArrayList<Goods> goodsList)throws Exception{
        boolean flag=false;
        String sql = "SELECT GoodsId, UserId,Name,Category ,Num,Price,Description,Address,View_Num,Pictures FROM GoodsInfo";
        this.pstmt = this.conn.prepareStatement(sql);
        ResultSet rs= this.pstmt.executeQuery();

        while(rs.next()) {
            Goods goods=new Goods();
            goods.setGoodsID(rs.getString(1));
            goods.setUserId(rs.getString(2));
            goods.setName(rs.getString(3));
            goods.setCategory(rs.getString(4));
            goods.setNum(rs.getInt(5));
            goods.setPrice(rs.getDouble(6));
            goods.setDescription(rs.getString(7));
            goods.setAddress(rs.getString(8));
            goods.setView_num(rs.getInt(9));
            goods.setPictures(rs.getString(10));
            goodsList.add(goods);
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
}
