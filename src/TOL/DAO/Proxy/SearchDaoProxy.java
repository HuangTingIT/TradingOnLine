package TOL.DAO.Proxy;

import TOL.DAO.SearchGoods_Dao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Satan on 2015/12/21.
 */
public class SearchDaoProxy
{
    private DatabaseConnection dbc = null; //声明数据库实例
    private SearchGoods_Dao search_dao = null;
    public SearchDaoProxy() throws Exception
    {
        dbc = new DatabaseConnection();
        search_dao = new SearchGoods_Dao(dbc.getConnection());
    }
    public List<Goods> getBySearch(String keyword) throws Exception
    {
        List<Goods> list = new ArrayList<Goods>();
        try
        {
            list = this.search_dao.getBySearch(keyword);
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
