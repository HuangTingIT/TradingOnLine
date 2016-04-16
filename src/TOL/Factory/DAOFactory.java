package TOL.Factory;

import TOL.DAO.IEmailDAO;
import TOL.DAO.IGoodsDAO;
import TOL.DAO.IMPL.GoodsDAOImpl;
import TOL.DAO.IMPL.UserDAOImpl;
import TOL.DAO.Proxy.*;
import TOL.DAO.IUserDAO;

/**
 * Created by HuangTing on 2015/12/8.
 */
public class DAOFactory {
    public static IUserDAO getIUserDAOInstance(){
        return new UserDAOProxy();
    }

    public static IGoodsDAO getIGoodsDAOInstance(){
        return new GoodsDAOProxy();
    }

    public static SearchDaoProxy getSearchDaoProxy() throws Exception {
        return new SearchDaoProxy();
    }

    public static AddGoodsProxy getAddGoodsDaoProxy() throws Exception
    {
        return new AddGoodsProxy();
    }

    public static DeleteFromCarProxy getDeleteFromCarProxy() throws Exception{
        return new DeleteFromCarProxy();
    }

    public static JudgeTelDaoProxy getJudgeTelDaoProxy() throws Exception {
        return new JudgeTelDaoProxy();
    }

    public static AddInfoTelDaoProxy getAddInfoTelDaoProxy() throws Exception {
        return new AddInfoTelDaoProxy();
    }

    public static AddInfoMailDaoProxy getAddInfoMailDaoProxy() throws Exception {
        return new AddInfoMailDaoProxy();
    }

    public static OutShelvesDaoProxy getOutShelvesDaoProxy() throws Exception {
        return new OutShelvesDaoProxy();
    }

    public static FindUserByUserIdDaoProxy getFindUserByUserIdDaoProxy() throws Exception {
        return new FindUserByUserIdDaoProxy();
    }
    public static IEmailDAO getIEamilDAOInstance(){
        return new EmailDAOProxy();
    }
}
