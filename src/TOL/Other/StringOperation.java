package TOL.Other;

/**
 * Created by HuangTing on 2015/12/10.
 */
public class StringOperation{
    public static String chineseStr(String str){
        if(str== null){
            str="";
        }
        else{
            try{
                str=(new String(str.getBytes("UTF-8"),"GBK")).trim();
            }catch(Exception e){
                System.out.println(e.toString());
            }
        }
    return str;
    }
}