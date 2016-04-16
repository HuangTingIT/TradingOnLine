package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.DAO.FindUserByUserIDDao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;
import TOL.VO.User;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class FindUserByUserIdDaoProxy {
    private DatabaseConnection dbc = null; //声明数据库实例
    private FindUserByUserIDDao find = null;
    public FindUserByUserIdDaoProxy() throws Exception {
        dbc = new DatabaseConnection();
        find = new FindUserByUserIDDao(dbc.getConnection());
    }
    public User findUserByUserId(String userid) throws Exception {
        User user = null;
        try
        {
            user = this.find.findUserByUserId(userid);
        }catch(Exception es)
        {
            throw es;
        }finally
        {
            this.dbc.close();
        }
        return user;
    }
}
