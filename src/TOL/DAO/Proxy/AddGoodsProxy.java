package TOL.DAO.Proxy;

import TOL.DAO.AddGoods_Dao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import java.util.ArrayList;

/**
 * Created by Satan on 2015/12/21.
 */
public class AddGoodsProxy
{
    private DatabaseConnection dbc = null; //声明数据库实例
    private AddGoods_Dao add_dao = null;
    public AddGoodsProxy() throws Exception
    {
        dbc = new DatabaseConnection();
        add_dao = new AddGoods_Dao(dbc.getConnection());
    }
    public boolean addGoods(Goods goods,String UserId) throws Exception
    {
        boolean judge;
        try
        {
            judge = this.add_dao.addGoods(goods,UserId);
        }catch(Exception es)
        {
            throw es;
        }finally
        {
            this.dbc.close();
        }
        return judge;
    }
    public boolean searchGoods(ArrayList<Goods> goodsListNum, String UserId) throws Exception
    {
        boolean judge;
        try
        {
            judge = this.add_dao.searchGoods(goodsListNum,UserId);
        }catch(Exception es)
        {
            throw es;
        }finally
        {
            this.dbc.close();
        }
        return judge;
    }
}
