<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2016/2/29
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <link rel="stylesheet" href="css/login.css" type="text/css" media="all">
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
    <!--//fonts-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript" src="js/changepassword.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
    <style type="text/css">
        form{
            width: 100%;
            height: 100%;
            margin: 2.5em 0 0 5em;
            padding-left: 0;
        }
        input[type="password"]{
            border: 1px solid #aaa;
            margin: 0;
            height: 3.2em;
            width: 290px;
        }
        .inpu{
            font-size: 1.2em;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .content{
            margin-top: 0;
        }
        input[type="button"]{
            background: #ff4500;
            color: #fff;
            width: 290px;
            height: 3.2em;
            margin-top: 3em;
            font-size: 14px;
        }
        input[type="button"]:hover{
            background-color: #ee3400;
            color: #fff;
        }
    </style>
</head>
<body style="background-color: #fff">
<div id="head">
    <div class="logo" id="logo">
        <a href="index.jsp">
            <img src="images/logo.p.png" alt="" ></a> <i>修改密码</i>
    </div>
    <div class="clearfix"></div>
</div>
<div id="nav">
    <div class="nav-2">
        <div class="mod-nav clearfix">
            <h1 class="page-type-notab"></h1>
        </div>
    </div>
</div>
<div class="content">
    <div class="container">
        <form action="" name="changePW">
            <div>
                <div>
                    <label class="inpu">请输入新密码:</label>
                </div>
                <input type="password" name="FirstPW" style="margin-bottom: 3px;">
                <p class="msg"> <i class="err"></i>
                </p>
            </div>

            <div style="margin-bottom: 1.5em">
                <label>
                    <span></span> <em class="active">弱</em> <em>中</em>
                    <em>强</em>
                </label>
            </div>

            <div>
                <div>
                    <label class="inpu">请再次输入新密码:</label>
                </div>
                <input class="pw2" type="password" name="SecondPW" disabled="">
                <p class="msg">
                    <i class=""></i>
                </p>
            </div>

            <div>
                <input type="button" class="submitBtn btn" value="确认修改" disabled="" onclick="judgeChange()"></div>
        </form>
        <div id="wQwgif">
            <img src="images/9.gif" alt=""></div>
        <div class="clearfix"></div>
    </div>
</div>

<!---->
<div class="clearfix"></div>
<!---->
<div id="footer">
    <p id="footer-grid">
        ——·吉林大学商品交易平台·——
        <br>Copyright &copy; 2015.JLU.You come I go.</p>

</div>
</body>
</html>