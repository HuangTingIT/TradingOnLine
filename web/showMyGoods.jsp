<%@ page import="TOL.VO.Goods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="TOL.VO.User" %><%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 17:11
  To change this template use File | Settings | File Templates.

  <c:foreach var="goods" items="${sessionScope.GoodsList}" varStatus="goodsCount">
    商品名称:${goods}<br>
    种类:${goods.categor}<br>
    数量:${goods.num}<br>
    价格:${goods.price}<br>
    描述:${goods.description}<br>
    地址:${goods.address}<br>
    浏览次数:${goods.vew_num}<br>
    图片：
</c:foreach>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="js/jquery.min.js"></script>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <link rel="icon" href="images/icon.png" type="image/png" sizes="16x16">
    <meta name="description" content="你来我往——吉林大学商品交易平台，为师生提供商品交易（含二手交易）、求购商品等信息，充分满足其种类多、规模小的特点。你来我往，吉大人及时、便捷、安全的商品交易平台！">
    <meta name="keywords" content="吉大，吉大二手，吉大2手，吉大二手交易，吉大闲置，吉大交换，吉大商品市场，吉大跳骚，你来我往" />
    <script src="js/aler.js" type="text/javascript"></script>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!--fonts-->
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Vollkorn:400,700' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <script>
        function checklogin(userid) {
            var id = userid;
            if (id == null) {
                alert("请先登录!");
                return false;
            }
            else {
                return true;
            }
        }
    </script>
    <style>
        span#buy:hover{
            background:#FF4500;
            color:#FFF;
        }
        a#buy2{
            color: #fff;
        }
        a#buy2:hover{
            background: #fff;
            color:#FF4500;
        }
    </style>
</head>
<body>
<%
    if(session.getAttribute("User")==null){
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }else {
%>
<jsp:include page="header.jsp"/>

<%
    //request.setCharacterEncoding("GBK");
    if (session.getAttribute("judge_addGoods") != null && (boolean) session.getAttribute("judge_addGoods") == true) {
%>
<h1>物品添加成功</h1>
<%
    }
%>
<%
    ArrayList<Goods> goodsList = (ArrayList<Goods>) session.getAttribute("GoodsList");
    if (goodsList == null || (goodsList.size() == 0)) {
%>
<h1>您还没有发布商品
    <h1>
            <%
    }else{
    for(int i=0;i<goodsList.size();i++){
        System.out.print(goodsList.size());
        Goods goods=goodsList.get(i);

%>



        <div class="container">
            <!--banner-->
            <div class="banner ">
                <div class="wmuSlider example1">
                    <div class="wmuSliderWrapper">
                        <%
                            String publicPath = "GoodsPictures/";
                            String path[] = goods.getPictures().split(";");

                            for (int j = 0; j < path.length; j++) {
                                String filePath = publicPath + path[j];
                                System.out.println("\n" + filePath);
                        %>
                        <article style="position: absolute; width: 100%; opacity: 0;">
                            <div class="banner-wrap">
                                <div class="short">
                                    <a href="single.jsp?goodsId=<%=goods.getGoodsID()%>" class="ban">
                                        <img class="img-responsive" src="<%=filePath%>" width="400" height="400" alt=""></a>
                                </div>
                                <div class="month">
                                    <h4>名称：<%=goods.getName()%><br>
                                        数量：<%=goods.getNum()%><br>
                                        种类：<%=goods.getCategory()%><br>
                                        地址：<%=goods.getAddress()%><br>
                                        <!--被浏览次数:<%=goods.getView_num()%>--><br>
                                    </h4>

                                    <div class="month-grid">
                                        <p><%=goods.getDescription()%>
                                        </p>

                                        <div class="banner-btns">
                                            <%
                                                String userid = goods.getUserId();
                                                String goodsid = goods.getGoodsID();
                                                String hre = "OutShelves?userid="+userid+"&goodsid="+goodsid;
                                            %>
                                            <span class="buy" id="buy">价格：<%=goods.getPrice()%></span>
                                            <span class="buy" ><a id="buy2"href=<%=hre%>>下架</a></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </article>
                        <%}%>
                    </div>
                </div>
                <!---->
                <script src="js/jquery.wmuSlider.js"></script>
                <script>
                    $('.example1').wmuSlider({
                        pagination: false,
                    });
                </script>

            </div>
        </div>

            <%

                                                }
                                            }
                                        %>
            <%}%>
</body>
</html>
