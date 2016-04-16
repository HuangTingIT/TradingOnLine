package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.DAO.OutShelvesDao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import javax.servlet.ServletContext;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OutShelvesDaoProxy {
    private DatabaseConnection dbc= null;
    private OutShelvesDao out = null;
    public OutShelvesDaoProxy() throws Exception {
        dbc = new DatabaseConnection();
        out = new OutShelvesDao(dbc.getConnection());
    }
    public List<Goods> Out(String userid, String goodsid, ServletContext servletContext) throws Exception {
        List<Goods> list = new ArrayList<Goods>();
        try
        {
            list = this.out.Out(userid, goodsid, servletContext);
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

