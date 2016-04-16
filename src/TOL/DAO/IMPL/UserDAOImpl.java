package TOL.DAO.IMPL;

import TOL.DAO.IUserDAO;
import TOL.VO.User;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by HuangTing on 2015/12/8.
 */
public class UserDAOImpl implements IUserDAO{
    private Connection conn=null;
    private PreparedStatement pstmt=null;
    public UserDAOImpl(Connection conn){
        this.conn=conn;
    }


    public boolean findLoginById(User user)throws Exception{
        boolean flag=false;
        byte[]data=null;
        String sql="SELECT TelePhone,Email,RealName,NickName,Sex ,Icon FROM UserInfo WHERE UserId=? AND PassWord=?";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,user.getUserId());
        this.pstmt.setString(2,user.getPassWord());
        ResultSet rs=this.pstmt.executeQuery();
        if(rs.next()){
            user.setTelePhone(fitData(rs.getString(1)));
            user.setEmail(fitData(rs.getString(2)));
            user.setRealName(fitData(rs.getString(3)));
            user.setNickName(fitData(rs.getString(4)));
            user.setSex(fitData(rs.getString(5)));
            if(rs.getBlob(6)!=null){
                Blob b=rs.getBlob(6);
                InputStream in=b.getBinaryStream();
                try{
                    int size=(int)b.length();
                    data=new byte[size];
                    in.read(data);
                    in.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
                user.setIcon(data);
            }
            flag=true;
        }
        this.pstmt.close();
        return flag;
    }
    public boolean findLoginByTel(User user)throws Exception{
        boolean flag=false;
        byte[]data=null;
        String sql="SELECT UserId,Email,RealName,NickName,Sex ,Icon FROM UserInfo WHERE TelePhone=? AND PassWord=?";
        this.pstmt=this.conn.prepareStatement(sql);
        this.pstmt.setString(1,user.getTelephone());
        this.pstmt.setString(2,user.getPassWord());
        ResultSet rs=this.pstmt.executeQuery();
        if(rs.next()){
            user.setUserId(fitData(rs.getString(1)));
            user.setEmail(fitData(rs.getString(2)));
            user.setRealName(fitData(rs.getString(3)));
            user.setNickName(fitData(rs.getString(4)));
            user.setSex(fitData(rs.getString(5)));
            if(rs.getBlob(6)!=null){
                Blob b=rs.getBlob(6);
                InputStream in=b.getBinaryStream();
                try{
                    int size=(int)b.length();
                    data=new byte[size];
                    in.read(data);
                    in.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
                user.setIcon(data);
            }
            flag=true;
        }
        this.pstmt.close();
        return flag;
    }

    public boolean doRegister(User user) throws Exception {
        boolean flag = false;
        String sql = "INSERT INTO UserInfo(UserID,PassWord,TelePhone,RealName,Email)  VALUES (SEQ_ID.NEXTVAL,?,?,?,?)";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, user.getPassWord());
        this.pstmt.setString(2, user.getTelephone());
        this.pstmt.setString(3, user.getRealName());
        this.pstmt.setString(4, user.getEmail());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
            conn.commit();
        }
        findLoginByTel(user);//此时user里只有手机号和密码，现在赋值ID；
        this.pstmt.close();
        return flag;
    }
    public boolean doAddInfo(User user) throws Exception {
        boolean flag = false;
        String sql = "UPDATE  UserInfo set Email=?,RealName=?,Sex=? ,NickName=?,TelePhone=? ,PassWord=? where UserId=? ";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, user.getEmail());
        this.pstmt.setString(2, user.getRealName());
        this.pstmt.setString(3, user.getSex());
        this.pstmt.setString(4,user.getNickName());
        this.pstmt.setString(5,user.getTelephone());
        this.pstmt.setString(6,user.getPassWord());
        this.pstmt.setString(7,user.getUserId());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }

    public boolean doInsertPic(User user, FileInputStream fis, int fileSize) throws Exception {
        System.out.println("try doInsertPic");
        boolean flag = false;
        String sql = "UPDATE  UserInfo set Icon=? where UserId=? ";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setBinaryStream(1,fis,fileSize);
        this.pstmt.setString(2,user.getUserId());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }

    public boolean findUserInfo(User user,int width,int height)throws Exception{
        boolean flag = false;
        byte[]data=null;
        String sql = "SELECT RealName,TeLePhone,Email,Sex,Icon ,NickName FROM UserInfo WHERE UserId=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1,user.getUserId());
        ResultSet rs = this.pstmt.executeQuery();
        if(rs.next()) {
            user.setRealName(fitData(rs.getString(1)));
            user.setTelePhone(fitData(rs.getString(2)));
            user.setEmail(fitData(rs.getString(3)));
            user.setSex(fitData(rs.getString(4)));
            Blob b=rs.getBlob(5);
            user.setNickName(fitData(rs.getString(6)));
            if(b!=null){
                InputStream in=b.getBinaryStream();
                try{
                    int size=(int)b.length();
                    data=new byte[size];
                    in.read(data);
                    in.close();
                }catch(IOException e){
                    e.printStackTrace();
                }
                //data= SetImgSize.ChangeImgSize(data,width,height);
                user.setIcon(data);
            }
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }
    public boolean findLoginByEmail(User user)throws Exception {
        boolean flag = false;
        byte[] data = null;
        String sql = "SELECT RealName,TeLePhone,UserId,Sex,Icon ,NickName  FROM UserInfo WHERE Email=?";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, user.getEmail());
        ResultSet rs = this.pstmt.executeQuery();
        if (rs.next()) {
            user.setRealName(fitData(rs.getString(1)));
            user.setTelePhone(fitData(rs.getString(2)));
            user.setUserId(fitData(rs.getString(3)));
            user.setSex(fitData(rs.getString(4)));
            Blob b = rs.getBlob(5);
            user.setNickName(fitData(rs.getString(6)));
            if (b != null) {
                InputStream in = b.getBinaryStream();
                try {
                    int size = (int) b.length();
                    data = new byte[size];
                    in.read(data);
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                //data= SetImgSize.ChangeImgSize(data,width,height);
                user.setIcon(data);
            }
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }

    public String fitData(String data){
        if(data==null){
            return "";
        }else{
            return data;
        }
    }

    public boolean changePassWord(User user)throws Exception{
        boolean flag = false;
        String sql = "UPDATE  UserInfo set PassWord=?  where UserId=? ";
        this.pstmt = this.conn.prepareStatement(sql);
        this.pstmt.setString(1, user.getPassWord());
        this.pstmt.setString(2,user.getUserId());
        int rowCount = this.pstmt.executeUpdate();
        if(rowCount != 0) {
            flag = true;
        }
        conn.commit();
        this.pstmt.close();
        return flag;
    }

}
