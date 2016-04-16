<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2016/2/24
  Time: 14:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <link href="css/FindCode.css" rel="stylesheet" type="text/css" media="all"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="icon" href="images/icon.png" type="image/png" sizes="16x16">
    <meta name="description" content="你来我往——吉林大学商品交易平台，为师生提供商品交易（含二手交易）、求购商品等信息，充分满足其种类多、规模小的特点。你来我往，吉大人及时、便捷、安全的商品交易平台！">
    <meta name="keywords" content="吉大，吉大二手，吉大2手，吉大二手交易，吉大闲置，吉大交换，吉大商品市场，吉大跳骚，你来我往" />
    <script src="js/aler.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/sendMail.js"></script>
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
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
            });
        });
    </script>
</head>
<body style="background-color: #fff">
<div id="head">
    <div class="logo" id="logo">
        <a href="index.jsp">
            <img src="images/logo.p.png" alt="" ></a> <i>找回密码</i>
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
        <div id="findcode">
            <div class="finditm" style="margin-top: 1.3em;">邮箱:</div>
            <input type="text" class="input title" name="Email" onblur="MailAjax()" value="">
            <p class="msg" id="emailJudge" name="judge"> <i class="ati"></i>
                5-25个字符，一个汉字为两个字符
            </p>
            <div id="sendiv">
                <span id="sendsp" class="submitBtn btn" disabled="" onclick="sendnum();sendCodeAjax()">发送验证码</span>
            </div>
            <div id="sendiv">
                <span id="sendsp2" class="submitBtn btn" style="display: none"><time id="t">60</time>s后重新发送</span>
            </div>
            <form action="ChangePassWord.jsp" id="form2">
                <div class="finditm">验证码:</div>
                <input type="text" name="Code" disabled="" onblur="judgeCode()"/>
                <p class="msg" id="codeTip"> <i class="ati"></i>
                    5-25个字符，一个汉字为两个字符
                </p>
                <div>
                    <input type="submit" id="sub" class="submitBtn btn" value="下一步" disabled="" />
                    <input type="hidden" value="1" id="errorCount">
                </div>
            </form>
        </div>
        <div id="wQwgif">
            <img src="images/9.gif" alt=""></div>
    </div>
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