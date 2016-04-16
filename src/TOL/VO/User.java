/**
 * Created by HuangTing on 2015/12/8.
 */
package TOL.VO;

public class User{
    private String userId;
    private String realName;
    private String passWord;
    private String nickName;
    private String sex;
    private String email;
    private String telePhone;
    private byte[] icon;

    public void setUserId(String userid){
        this.userId=userid;
    }
    public void setRealName(String realName){
        this.realName=realName;
    }
    public void setNickName(String nickname){
        this.nickName=nickname;
    }
    public void setPassWord(String password){
        this.passWord=password;
    }
    public void setSex(String sex){
        this.sex=sex;
    }
    public void setEmail(String email){
        this.email=email;
    }
    public void setTelePhone(String telephone){
        this.telePhone=telephone;
    }
    public void setIcon(byte[] data){
        this.icon=data;
    }
    public String getUserId(){
        return this.userId;
    }
    public String getRealName(){
        return this.realName;
    }
    public String getPassWord(){
        return this.passWord;
    }
    public String getNickName(){
        return this.nickName;
    }
    public String getSex(){
        return this.sex;
    }
    public String getEmail(){
        return this.email;
    }
    public String getTelephone(){
        return this.telePhone;
    }
    public byte[] getIcon(){
        return this.icon;
    }
}