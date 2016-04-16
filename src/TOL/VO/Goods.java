package TOL.VO;

/**
 * Created by HuangTing on 2015/12/11.
 */
public class Goods {
    private String goodsID="";
    private String userId="";
    private String name="";
    private String category="";
    private int num=1;
    private double price=0;
    private  String description="";
    private  String pictures="";
    private String address="";
    private String time = "";
    private int view_num=0;
    public void setGoodsID(String goodsID){
        this.goodsID=goodsID;
    }
    public void setUserId(String userId){
        this.userId=userId;
    }
    public void setName(String name){
        this.name=name;
    }
    public void setCategory(String category){
        this.category=category;
    }
    public void setNum(int num){
        this.num=num;
    }
    public void setPrice(double price){
        this.price=price;
    }
    public void setDescription(String description){
        this.description=description;
    }
    public void setPictures(String pictures){
        this.pictures=pictures;
    }
    public void setAddress(String address){
        this.address=address;
    }
    public void setTime(String time){
        this.time = time;
    }
    public void setView_num(int view_num){
        this.view_num=view_num;
    }

    public String getGoodsID(){
        return this.goodsID;
    }
    public String getUserId(){
        return this.userId;
    }
    public String getName(){
        return this.name;
    }
    public String getCategory(){
        return this.category;
    }
    public int getNum(){
        return this.num;
    }
    public double getPrice(){
        return this.price;
    }
    public String getDescription(){
        return this.description;
    }
    public String getPictures(){
        return this.pictures;
    }
    public String getAddress(){
        return this.address;
    }
    public String getTime(){
        return this.time;
    }
    public int getView_num(){
        return view_num;
    }
}
