function checkSelected(){
    var checkBox = document.getElementsByName("newslist");
    var goodsid = document.getElementsByName("hiddenGoodsId");
    var address = "ShoppingDeleteServlet?goodsid=";
    var userid  = document.getElementsByName("hiddenUserId")[0].value;
    var j = 0;
    for(i=0;i<checkBox.length;i++){
        if(checkBox[i].checked==true){
            j++;
            if(j>1){
                address = address+","+goodsid[i].value;
            }else{
                address = address+goodsid[i].value;
            }
        }
    }
    address = address+"&loginUserId="+userid;
    document.getElementById("jz2").href = address;
    return true;
}