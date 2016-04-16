package TOL.DAO.IMPL;

import TOL.DAO.IEmailDAO;
import TOL.VO.Email;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by HuangTing on 2016/2/29.
 */
public class EmailDAOImpl implements IEmailDAO{
    private Connection conn=null;
    private PreparedStatement pstmt=null;
    public EmailDAOImpl(Connection conn){
        this.conn=conn;
    }
    public boolean InsertCode(Email email) throws Exception{
        boolean flag=false;
        String sql="UPDATE MailValidate set Code=?  WHERE Email= ? ";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,email.getCode());
        this.pstmt.setString(2,email.getEmail());
        int rowCount=this.pstmt.executeUpdate();
        if(rowCount!=0){
            flag=true;
            this.conn.commit();System.out.print("yanzhengma "+email.getCode());
        }
        this.pstmt.close();
        return flag;
    }
    public boolean findEmail(Email email) throws Exception{
        boolean flag=false;
        String sql= "SELECT Code FROM MailValidate WHERE Email=?";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,email.getEmail());
        ResultSet rs=this.pstmt.executeQuery();
        if(rs.next()){
            flag=true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;

    }
    public boolean findCode(Email email) throws Exception{
        boolean flag=false;
        String sql= "SELECT Code FROM MailValidate WHERE Email=?";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,email.getEmail());
        ResultSet rs=this.pstmt.executeQuery();
        if(rs.next()){
            email.setCode(rs.getString(1));
            flag=true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;

    }

    public boolean doInsertEmail(Email email) throws Exception{
        boolean flag=false;
        String sql="INSERT INTO MailValidate (Email) VALUES (?)";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,email.getEmail());
        int rowCount=this.pstmt.executeUpdate();
        if(rowCount!=0){
            flag=true;
            conn.commit();
        }
        this.pstmt.close();
        return flag;
    }
}
