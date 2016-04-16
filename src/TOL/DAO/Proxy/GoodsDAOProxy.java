package TOL.DAO.Proxy;

import TOL.DAO.IGoodsDAO;
import TOL.DAO.IMPL.GoodsDAOImpl;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import java.util.ArrayList;

/**
 * Created by HuangTing on 2015/12/11.
 */
public class GoodsDAOProxy implements IGoodsDAO {
    private DatabaseConnection dbc=null;
    private IGoodsDAO dao=null;
    public GoodsDAOProxy(){
        try{
            this.dbc=new DatabaseConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
        this.dao=new GoodsDAOImpl(dbc.getConnection());
    }
    public boolean findGoodsByGoodsId(Goods goods,String goodsId)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findGoodsByGoodsId(goods,goodsId);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean doRelease(Goods goods)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doRelease(goods);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findAllGoods(ArrayList<Goods> goodsList)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findAllGoods(goodsList);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findGoodsByName(ArrayList<Goods> goodsList,String name)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findGoodsByName(goodsList,name);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;

    }
    public boolean doReEdit(Goods goods)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doReEdit(goods);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;

    }
    public boolean doDelete(Goods goods)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doDelete(goods);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findGoodsByNameAndUserID(Goods goods)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findGoodsByNameAndUserID(goods);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findGoodsByUserId(ArrayList<Goods> goodsList,String UserId)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findGoodsByUserId(goodsList,UserId);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }

    public boolean doInsertPictures(Goods goods)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doInsertPictures(goods);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    //public boolean findUserInfo(Goods goods)throws Exception;

}
