package TOL.DAO;

/**
 * Created by Satan on 2016/2/20.
 */
import java.sql.*;
import java.util.*;

public class JudgeTel_Dao {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    public JudgeTel_Dao(Connection conn){
        this.conn = conn;
    }
    public boolean judgeTel(String telephone) throws SQLException {
        boolean judge = true; //真值代表此电话号码未注册，可以使用
        String sql = "SELECT TELEPHONE FROM USERINFO WHERE TELEPHONE=?";
        this.pstmt = conn.prepareStatement(sql);
        this.pstmt.setString(1, telephone);
        ResultSet rs = this.pstmt.executeQuery();
        while(rs.next()){
            if(rs.getString(1).equals(telephone)){
                judge = false; //此电话号码已被注册
                System.out.println("此号码已被占用");
            }
        }
        rs.close();
        pstmt.close();
        return judge;
    }
}
