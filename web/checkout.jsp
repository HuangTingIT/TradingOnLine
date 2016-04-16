<%@ page import="TOL.VO.Goods" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="TOL.VO.User" %>
<%@ page import="TOL.Factory.DAOFactory" %>
<html>
<head>
    <title>购物车</title>

    <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery.1.4.2-min.js"></script>
    <script src="js/checkout.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <script type="text/javascript" src="js/checkSelected.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>

</head>
<body>
<!--header-->
<%
    if (session.getAttribute("User") == null) {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    } else {
%>
<jsp:include page="header.jsp"/>

<!---->

<!---->
<div class="content">
    <div class="container">
        <div class="check-out">
            <div class="container">
                <div class="gwc" style=" margin:auto;">
                    <table cellpadding="0" cellspacing="0" class="gwc_tb1">
                        <tr>
                            <td class="tb1_td1">
                                <input id="Checkbox1" type="checkbox" class="allselect" ></td>
                            <td class="tb1_td2">全选</td>
                            <td class="tb1_td3">商品信息</td>
                            <td class="tb1_td4">交易信息</td>
                            <!-- <td class="tb1_td5">数量</td>
                        -->
                            <td class="tb1_td6">单价</td>
                            <td class="tb1_td7">操作</td>
                        </tr>
                    </table>


                    <%
                        ////request.setCharacterEncoding("GBK");
                        if (session.getAttribute("judge_addGoods") != null && (boolean) session.getAttribute("judge_addGoods") == true) {
                    %>
                    <h1>物品添加成功</h1>
                    <%
                        }
                    %>
                    <%
                        ArrayList<Goods> goodsList = (ArrayList<Goods>) session.getAttribute("GoodsList");
                        if (goodsList == null || (goodsList.size() == 0)) {
                    %><h1>您的购物车为空</h1>
                    <%
                    } else {
                        for (int i = 0; i < goodsList.size(); i++) {
                            System.out.print(goodsList.size());
                            Goods goods = goodsList.get(i);
                            User visitor = new User();
                            visitor = DAOFactory.getFindUserByUserIdDaoProxy().findUserByUserId(goods.getUserId());
                    %>


                    <%
                        String publicPath = "GoodsPictures/";
                        String path[] = goods.getPictures().split(";");
                        String filePath = publicPath + path[0];

                    %>
                    <table cellpadding="0" cellspacing="0" class="gwc_tb2">
                        <tr>
                            <td class="tb2_td1">
                                <input type="checkbox" value="1" name="newslist" id="newslist-1"/></td>
                            <%
                                String picPath = "single.jsp?goodsId="+goods.getGoodsID();
                            %>
                            <input type="hidden" name="hiddenGoodsId" value=<%=goods.getGoodsID()%>>
                            <td class="tb2_td2"><a href=<%=picPath%>> <img class="img-responsive" src="<%=filePath%>" alt=""></a>
                            </td>
                            <td class="tb2_td3"><a href=<%=picPath%>><%=goods.getName()%>
                            </a></td>
                            <td class="tb2_td4">
                                添加时间:<%=goods.getTime()%>   <br> 卖&nbsp;&nbsp;家:<%=visitor.getNickName()%>     <br>
                                联系电话:<%=visitor.getTelephone()%></td>
                            <td class="tb2_td5">
                                <label id="total1" class="tot"><%=goods.getPrice()%>
                                </label></td>
                            <%
                                User user = (User) session.getAttribute("User");
                                String delete_href = "ShoppingDeleteServlet?goodsid="+goods.getGoodsID()+"&loginUserId="+user.getUserId();
                            %>
                            <input type="hidden" name="hiddenUserId" value=<%=user.getUserId()%>>
                            <td class="tb2_td7"><a href=<%=delete_href%>>删除</a></td>
                        </tr>
                    </table>
                    <%
                            }
                        }
                    %>
                    <table cellpadding="0" cellspacing="0" class="gwc_tb3">
                        <tr>
                            <td class="tb1_td1"><input id="checkAll" class="allselect" type="checkbox"/></td>
                            <td class="tb1_td1">全选</td>
                            <td class="tb3_td1">
                                <input id="invert" type="checkbox"/>
                                反选
                            </td>
                            <td class="tb3_td2">已选商品
                                <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label>
                                件
                            </td>
                            <td class="tb3_td4">
                                <span id="jz1">删除</span>
                                <a href="" style=" display:none;" class="jz2" id="jz2" onclick="return checkSelected()">删除</a></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!---->
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!---->
<div class="footer">
    <div class="container">
        <p class="footer-grid" id="footer-grid">
            ——·吉林大学商品交易平台·——
            <br>Copyright &copy; 2015.JLU.You come I go.</p>

    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear'
             };
             */

            $().UItoTop({easingType: 'easeOutQuart'});

        });
    </script>
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</div>
<%}%>
</body>
</html>