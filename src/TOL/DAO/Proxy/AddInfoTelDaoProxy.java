package TOL.DAO.Proxy;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.DAO.AddInfoTelDao;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Goods;
public class AddInfoTelDaoProxy {
    private DatabaseConnection dbc = null;
    private AddInfoTelDao info = null;
    public AddInfoTelDaoProxy() throws Exception {
        dbc = new DatabaseConnection();
        info = new AddInfoTelDao(dbc.getConnection());
    }
    public boolean judgeTel(String telephone, String userid) throws Exception {
        boolean judge = false;
        try{
            judge = this.info.judgeTel(telephone, userid);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            this.dbc.close();
        }
        return judge;
    }
}
