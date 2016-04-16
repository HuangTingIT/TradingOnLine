<%@ page import="TOL.VO.Goods" %>
<%@ page import="TOL.Factory.DAOFactory" %>
<%@ page import="TOL.VO.User" %><%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2016/1/9
  Time: 10:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>Single</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="images/icon.png" type="image/png" sizes="16x16">
    <meta name="description" content="你来我往——吉林大学商品交易平台，为师生提供商品交易（含二手交易）、求购商品等信息，充分满足其种类多、规模小的特点。你来我往，吉大人及时、便捷、安全的商品交易平台！">
    <meta name="keywords" content="吉大，吉大二手，吉大2手，吉大二手交易，吉大闲置，吉大交换，吉大商品市场，吉大跳骚，你来我往" />
    <script src="js/aler.js" type="text/javascript"></script>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Vollkorn:400,700' rel='stylesheet' type='text/css'>
    <!--//fonts-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
            });
        });
    </script>
    <!---->
    <link rel="stylesheet" href="css/etalage.css">

    <script src="js/jquery.etalage.min.js"></script>
    <script src="js/recordTime.js"></script>
    <script>
        jQuery(document).ready(function($){

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,
                source_image_width: 800,
                source_image_height: 1000,
                show_hint: true,
                click_callback: function(image_anchor, instance_id){
                    alert('Callback example:\nYou clicked on an image with the anchor: "'+image_anchor+'"\n(in Etalage instance: "'+instance_id+'")');
                }
            });

        });
    </script>
</head>
<body>
<!--header-->
<div class="header">
    <div class="container">
        <!---->
        <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" alt=""></a>
        </div>
        <div class="header-right">
            <ul class="account">
                <!--<li><a href="ShowUserInfoServlet">我的账号</a></li>
                |-->
                <li><a href="CheckOutServlet"> 购物车 </a></li>
                |
                <%
                    if(session.getAttribute("User")==null)
                    {
                %>
                <li><a href="login.jsp">登录</a></li>
                |
                <li><a href="register.jsp"> 注册</a></li>
                |
                <%
                }
                else
                {
                %>
                <li><a href="ShowUserInfoServlet"> 我的账号</a></li>
                |
                <%
                    }
                %>
                <li><a href="LogoutServlet"> 退出</a></li>
                |
                <li><a href="addInfo.jsp"> 修改用户信息</a></li>
            </ul>
            <div class="header-bottom">
                <div class="top-nav">
                    <span class="menu"> </span>
                    <ul>
                        <li class="active"><a href="index.jsp">首页</a></li>
                        <li><a href="releaseGoods.jsp">发布商品</a></li>
                        <li><a href="ShowMyGoodsServlet">我的商品</a></li>

                    </ul>


                    <!--script-->
                    <script>
                        $("span.menu").click(function () {
                            $(".top-nav ul").slideToggle(500, function () {
                            });
                        });
                    </script>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!---->

<%
    Goods goods=new Goods();
    if(request.getAttribute("goodsId")!=null)
    {
        goods.setGoodsID((String) request.getAttribute("goodsId"));
    }
    else
    {
        goods.setGoodsID(request.getParameter("goodsId"));
    }
    try{
        DAOFactory.getIGoodsDAOInstance().findGoodsByGoodsId(goods,goods.getGoodsID());
    }catch(Exception e){
        e.printStackTrace();
    }
    User user = new User();
    user = DAOFactory.getFindUserByUserIdDaoProxy().findUserByUserId(goods.getUserId());
%>
<div class="content">
    <div class="container">
        <div class=" single">
            <div class="col-md-9 sin">
                <div class="single_left">
                    <div class="grid images_3_of_2">
                        <ul id="etalage">
                            <%
                                String publicPath = "GoodsPictures/";
                                String path[] = goods.getPictures().split(";");

                                for (int j = 0; j < path.length; j++) {
                                    String filePath = publicPath + path[j];
                            %>
                            <li>
                                <a href="optionallink.html">
                                    <img class="etalage_thumb_image" src="<%=filePath%>" class="img-responsive" />
                                    <img class="etalage_source_image" src="<%=filePath%>" class="img-responsive" title="" />
                                </a>
                            </li>
                            <%
                                }
                            %>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="desc1 span_3_of_2">
                        <div class="desc">
                            <h3><%=goods.getName()%></h3>
                            <h5 id="price"><%=goods.getPrice()%>元</h5>
                            <h5>宝贝地址：<%=goods.getAddress()%></h5>
                            <%
                                if(session.getAttribute("User")==null){
                            %>
                            <h5 style="color: red;font-size: 24px;font-weight: bold;">登陆即可查看卖家联系方式！</h5>
                            <%
                            }else{
                            %>
                            <h5>卖家昵称：<%=user.getNickName()%></h5>
                            <h5>卖家电话：<%=user.getTelephone()%></h5>
                            <%
                                }
                            %>
                            <form action="AddGoodsServlet" method="post" style="margin-top:30px" onsubmit="recordTime()">
                                <input type="hidden" name="userid" value="<%=goods.getUserId()%>">
                                <input type="hidden" name="goodsid" value="<%=goods.getGoodsID()%>">
                                <input type="hidden" name="time" value="">
                                <%
                                    if(session.getAttribute("User")!=null){
                                %>
                                <input type="submit" name="submit" value="添加购物车" style="padding:8px 16px;margin-top:2em;background:#ff4500;border:none;color:white">
                                <%
                                    }
                                %>
                            </form>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <!----- tabs-box ---->
                <div class="sap_tabs">
                    <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
                        <ul class="resp-tabs-list">
                            <li class="resp-tab-item " aria-controls="tab_item-0" role="tab"><span>Product Description</span></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="resp-tabs-container">
                            <h2 class="resp-accordion resp-tab-active" role="tab" aria-controls="tab_item-0"><span class="resp-arrow"></span>Product Description</h2><div class="tab-1 resp-tab-content resp-tab-content-active" aria-labelledby="tab_item-0" style="display:block">
                            <div class="facts">
                                <p > <%=goods.getDescription()%></p>
                            </div>
                        </div>
                            <h2 class="resp-accordion" role="tab" aria-controls="tab_item-1"><span class="resp-arrow"></span>Additional Information</h2><div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                            <div class="facts">
                                <p > Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections </p>
                                <ul >
                                    <li>Multimedia Systems</li>
                                    <li>Digital media adapters</li>
                                    <li>Set top boxes for HDTV and IPTV Player applications on various Operating Systems and Hardware Platforms</li>
                                </ul>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
                <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $('#horizontalTab').easyResponsiveTabs({
                            type: 'default', //Types: default, vertical, accordion
                            width: 'auto', //auto or any width like 600px
                            fit: true   // 100% fit in a container
                        });
                    });
                </script>
            </div>
        </div>





        <div class="clearfix"></div>
    </div>

    <div class="clearfix"> </div>
</div>
<!---->
<div class="footer">
    <div class="container">
        <p class="footer-grid" id="footer-grid">
            ——·吉林大学商品交易平台·——
            <br>Copyright &copy; 2015.JLU.You come I go.</p>

    </div>
    <script type="text/javascript">
        $(document).ready(function() {
            /*
             var defaults = {
             containerID: 'toTop', // fading element id
             containerHoverID: 'toTopHover', // fading element hover id
             scrollSpeed: 1200,
             easingType: 'linear'
             };
             */

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>

</body>
<%
    if(request.getAttribute("judge_addGoods")!=null&&(boolean)request.getAttribute("judge_addGoods")==true)
    {
%>
<script>
    alert("商品已添加");
</script>
<%
}else if(request.getAttribute("judge_addGoods")!=null&&(boolean)request.getAttribute("judge_addGoods")==false)
{
%>
<script>
    alert("商品添加失败，此商品可能是您可能已放入购物车或者是您自己发布的商品");
</script>
<%
    }
%>
</html>
