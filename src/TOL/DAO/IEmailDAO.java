package TOL.DAO;

import TOL.VO.Email;

/**
 * Created by HuangTing on 2016/2/29.
 */
public interface IEmailDAO {
    public boolean InsertCode(Email email) throws Exception;
    public boolean findEmail(Email email) throws Exception;
    public boolean doInsertEmail(Email email) throws Exception;
    public boolean findCode(Email email) throws Exception;
}
