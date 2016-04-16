package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/21.
 */
import  TOL.DAO.AddInfoMailDao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;

import java.sql.SQLException;

public class AddInfoMailDaoProxy {
    private DatabaseConnection dbc = null;
    private AddInfoMailDao info = null;
    public AddInfoMailDaoProxy() throws Exception {
        dbc = new DatabaseConnection();
        info = new AddInfoMailDao(dbc.getConnection());
    }
    public boolean judgeMail(String mail, String userid) throws Exception {
        boolean judge = false;
        try{
            judge = this.info.judgeMail(mail, userid);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            this.dbc.close();
        }
        return judge;
    }
}
