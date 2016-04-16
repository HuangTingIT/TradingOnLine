package TOL.DAO;
import TOL.VO.User;

import java.io.FileInputStream;

/**
 * Created by HuangTing on 2015/12/8.
 */
public interface IUserDAO {
    public boolean doRegister(User user)throws Exception;
    public boolean findLoginById(User user)throws Exception;
    public boolean findLoginByTel(User user)throws Exception;
    public boolean doAddInfo(User user)throws Exception;
    public boolean doInsertPic(User user, FileInputStream fis, int fileSize)throws Exception;
    public boolean findUserInfo(User user,int width,int height)throws Exception;
    public boolean findLoginByEmail(User user)throws Exception;
    public boolean changePassWord(User user) throws Exception;
}
