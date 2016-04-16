package TOL.DAO;

/**
 * Created by Satan on 2016/2/21.
 */
import java.sql.*;

public class AddInfoTelDao {
    private Connection conn;
    private PreparedStatement pstmt1;
    private PreparedStatement pstmt2;
    public AddInfoTelDao(Connection conn){
        this.conn = conn;
    }
    public boolean judgeTel(String telephone, String userid) throws SQLException {
        String sql1 = "SELECT TELEPHONE FROM USERINFO WHERE TELEPHONE=?";
        String sql2 = "SELECT TELEPHONE FROM USERINFO WHERE USERID=?"; //调取用户修改前手机号码，如果相同则算作可以使用
        String preTel = ""; //用户修改前的电话号码
        String nowTel = "";
        pstmt1 = conn.prepareStatement(sql1); //以手机号查询
        pstmt1.setString(1, telephone);
        ResultSet rs1 = pstmt1.executeQuery();
        pstmt2 = conn.prepareStatement(sql2); //以用户ID查询
        pstmt2.setString(1, userid);
        ResultSet rs2 = pstmt2.executeQuery();
        while(rs2.next()){
            preTel = rs2.getString(1);
        }
        while(rs1.next()){
            nowTel = rs1.getString(1); //如果查询到用户新填的号码，则nowTel!=""
        }
        rs1.close();
        rs2.close();
        pstmt1.close();
        pstmt2.close();
        if(nowTel.equals("")){ //未查询到用户新填写的电话号码
            return true; //返回真值代表该号码可以使用
        }
        else if(nowTel.equals(telephone)&&!nowTel.equals(preTel)){ //数据库中已存在所填号码，但此号码非用户之前的号码
            return false; //返回假值代表该号码已被占用
        }
        else if(nowTel.equals(preTel)){ //所填号码就是用户原来的号码
            return true;
        }
        else{
            return false;
        }
    }
}
