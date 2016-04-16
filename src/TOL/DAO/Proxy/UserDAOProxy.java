package TOL.DAO.Proxy;

/**
 * Created by HuangTing on 2015/12/8.
 */
import TOL.DAO.IMPL.UserDAOImpl;
import TOL.DAO.IUserDAO;
import TOL.DBC.DatabaseConnection;
import TOL.VO.User;

import java.io.FileInputStream;

//代理类 ，主要功能完成 数据库链接， 淑贤数据库的数据查询操作（接口） 关闭数据库
public class UserDAOProxy implements IUserDAO {
    private DatabaseConnection dbc=null;
    private IUserDAO dao=null;
    public UserDAOProxy(){
        try{
            this.dbc=new DatabaseConnection();
        }catch(Exception e){
            e.printStackTrace();
        }
        this.dao=new UserDAOImpl(dbc.getConnection());
    }
    public boolean findLoginById(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findLoginById(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findLoginByTel(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findLoginByTel(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean doRegister(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doRegister(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean doAddInfo(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doAddInfo(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean doInsertPic(User user, FileInputStream fis,int fileSize)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.doInsertPic(user,fis,fileSize);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findUserInfo(User user,int width,int height)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findUserInfo(user,width, height);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean findLoginByEmail(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.findLoginByEmail(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
    public boolean changePassWord(User user)throws Exception{
        boolean flag=false;
        try{
            flag=this.dao.changePassWord(user);
        }catch(Exception e){
            throw e;
        }finally{
            this.dbc.close();
        }
        return flag;
    }
}