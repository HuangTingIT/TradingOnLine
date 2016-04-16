<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="TOL.VO.User" %>
<%@ page contentType="text/html" pageEncoding="GBK" %>


<html>
<head>
    <title>个人资料</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
    <!--//theme-style-->
    <link href="css/showuserinfo.css" rel="stylesheet" type="text/css" media="all" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="images/icon.png" type="image/png" sizes="16x16">
    <meta name="description" content="你来我往——吉林大学商品交易平台，为师生提供商品交易（含二手交易）、求购商品等信息，充分满足其种类多、规模小的特点。你来我往，吉大人及时、便捷、安全的商品交易平台！">
    <meta name="keywords" content="吉大，吉大二手，吉大2手，吉大二手交易，吉大闲置，吉大交换，吉大商品市场，吉大跳骚，你来我往" />
    <script src="js/aler.js" type="text/javascript"></script>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!--fonts-->
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
</head>
<body>
<!--header-->

<jsp:include page="header.jsp"/>

<!---->

<!---->
<div class="container">

    <%
        //request.setCharacterEncoding("GBK");
        if (session.getAttribute("User") == null) {
    %><h1>还未登录</h1><%
} else {
%>

    <div class="col">
        <div class="hp-user-info">
            <div class="hd">
                <%
                    if (((User) session.getAttribute("User")).getIcon() == null) {
                %>
                <img class="user-pic" src="icon/default.jpg" width="75" height="75" border="none"></div>
            <%
            } else {
            %>
            <img class="user-pic" src="pic.jsp" width="75" height="75" border="none"></div>
        <%
            }
        %>
        <div class="bd">
            <a href="addInfo.jsp"><input type="button" class="submitBtn btn" value="编辑资料"></a>
        </div>
    </div>

    <div class="contact-grid">
        <table>
            <tr>
                <td class="thead">用户id:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getUserId()%></td>
            </tr>
            <tr>
                <td class="thead">昵&nbsp;称:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getNickName()%></td>
            </tr>
            <tr>
                <td class="thead">姓&nbsp;名:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getRealName()%></td>
            </tr>
            <tr>
                <td class="thead">性&nbsp;别:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getSex()%></td>
            </tr>
            <tr>
                <td class="thead">手机号:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getTelephone()%></td>
            </tr>
            <tr>
                <td class="thead">邮&nbsp;箱:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getEmail()%></td>
            </tr>

        </table>
    </div>

    <div class="clearfix"></div>
</div>
<div class="clearfix"></div>
</div>
<%
    }
%>

</div>
<!---->
<div class="clearfix"></div>
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
    <a href="#" id="toTop" style="display: block;">
        <span id="toTopHover" style="opacity: 1;"></span>
    </a>

</div>

</body>
</html>