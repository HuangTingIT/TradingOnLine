package TOL.DAO;

import TOL.VO.Goods;

import java.util.ArrayList;

/**
 * Created by HuangTing on 2015/12/11.
 */
public interface IGoodsDAO {
    public boolean doRelease(Goods goods)throws Exception;
    public boolean findGoodsByName(ArrayList<Goods> goodsList,String name)throws Exception;
    public boolean doReEdit(Goods goods)throws Exception;
    public boolean doDelete(Goods goods)throws Exception;
    public boolean findGoodsByNameAndUserID(Goods goods)throws Exception;
    public boolean doInsertPictures(Goods goods)throws Exception;
    public boolean findGoodsByUserId(ArrayList<Goods> goodsList,String UserId)throws Exception;
    public boolean findGoodsByGoodsId(Goods goods,String goodsId)throws Exception;
    public boolean findAllGoods(ArrayList<Goods> goodsList)throws Exception;
    //public boolean findUserInfo(Goods goods)throws Exception;
}
