package TOL.DAO.Proxy;

import TOL.DAO.IEmailDAO;
import TOL.DAO.IMPL.EmailDAOImpl;
import TOL.DBC.DatabaseConnection;
import TOL.VO.Email;

/**
 * Created by HuangTing on 2016/2/29.
 */
public class EmailDAOProxy implements IEmailDAO{

    private DatabaseConnection dbc=null;
    private IEmailDAO dao=null;
    public EmailDAOProxy(){
        try{
            dbc=new DatabaseConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
        dao=new EmailDAOImpl(dbc.getConnection());
    }
    @Override
        public boolean InsertCode(Email email) throws Exception{
        boolean flag=false;
        try{
            flag=dao.InsertCode(email);
        }catch (Exception e){
            throw e;
        }finally {
            this.dbc.close();
        }
        return flag;
    }

    @Override
    public boolean findEmail(Email email) throws Exception{
        boolean flag=false;
        try{
            flag=dao.findEmail(email);
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            this.dbc.close();
        }
        return flag;
    }
    public boolean findCode(Email email) throws Exception{
        boolean flag=false;
        try{
            flag=dao.findCode(email);
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            this.dbc.close();
        }
        return flag;
    }
    public boolean doInsertEmail(Email email) throws Exception{
        boolean flag=false;
        try{
            flag=dao.doInsertEmail(email);
        }catch(Exception e){
            e.printStackTrace();
        }finally {
            this.dbc.close();
        }
        return flag;
    }
}
