package TOL.DAO;

/**
 * Created by Satan on 2016/2/21.
 */
import TOL.VO.User;

import java.sql.*;
import java.util.*;

public class FindUserByUserIDDao {
    private Connection conn;
    private PreparedStatement pstmt;
    public FindUserByUserIDDao(Connection conn) {
        this.conn = conn;
    }
    public User findUserByUserId(String userid) throws SQLException {
        String sql = "SELECT * FROM USERINFO WHERE USERID=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, userid);
        ResultSet rs = pstmt.executeQuery();
        User user = null;
        while(rs.next()){
            user = new User();
            user.setUserId(rs.getString(1));
            user.setTelePhone(rs.getString(3));
            user.setNickName(rs.getString(6));
        }
        return user;
    }
}
