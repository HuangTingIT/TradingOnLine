package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/18.
 */
import TOL.DAO.DeleteFromCarDao;
import TOL.DAO.SearchGoods_Dao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeleteFromCarProxy {
    private DatabaseConnection dbc = null; //声明数据库实例
    private DeleteFromCarDao del = null;
    public DeleteFromCarProxy() throws Exception {
        dbc = new DatabaseConnection();
        del = new DeleteFromCarDao(dbc.getConnection());
    }
    public List<Goods> delete(String[] goodsid, String userid) throws Exception {
        List<Goods> list = new ArrayList<Goods>();
        try
        {
            list = this.del.delete(goodsid, userid);
        }catch(Exception es)
        {
            throw es;
        }finally
        {
            this.dbc.close();
        }
        return list;
    }
}
