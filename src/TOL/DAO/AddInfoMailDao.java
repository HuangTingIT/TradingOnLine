package TOL.DAO;

/**
 * Created by Satan on 2016/2/21.
 */
import java.sql.*;

public class AddInfoMailDao {
    private Connection conn;
    private PreparedStatement pstmt1;
    private PreparedStatement pstmt2;
    public AddInfoMailDao(Connection conn){
        this.conn = conn;
    }
    public boolean judgeMail(String mail, String userid) throws SQLException {
        String sql1 = "SELECT EMAIL FROM USERINFO WHERE EMAIL=?";
        String sql2 = "SELECT EMAIL FROM USERINFO WHERE USERID=?";
        String preMial = "";
        String nowMail = "";
        pstmt1 = conn.prepareStatement(sql1);
        pstmt1.setString(1, mail);
        ResultSet rs1 = pstmt1.executeQuery();
        while(rs1.next()){
            nowMail = rs1.getString(1);
        }
        if(!userid.equals("-1")){
            pstmt2 = conn.prepareStatement(sql2);
            pstmt2.setString(1, userid);
            ResultSet rs2 = pstmt2.executeQuery();
            while(rs2.next()){
                preMial = rs2.getString(1);
            }
        }
        if(nowMail.equals("")){
            return true;
        }
        else if(nowMail.equals(preMial)){
            return true;
        }
        else{
            return false;
        }
    }
}
