package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/20.
 */
import TOL.DAO.JudgeTel_Dao;
import TOL.DBC.DatabaseConnection;

import java.sql.SQLException;

public class JudgeTelDaoProxy {
    private DatabaseConnection dbc = null; //声明数据库实例
    private JudgeTel_Dao ju = null;
    public JudgeTelDaoProxy() throws Exception {
        dbc = new DatabaseConnection();
        ju = new JudgeTel_Dao(dbc.getConnection());
    }
    public boolean judgeTel(String telephone) throws Exception {
        boolean judge;
        try
        {
            judge = this.ju.judgeTel(telephone);
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
