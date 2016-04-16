<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="GBK" %>
<%@ page import="java.util.*" %>




<html>
<head>
    <title>注册</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/register.js" type="text/javascript"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link rel="stylesheet" href="css/register.css" type="text/css" media="all">
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

</head>
<body>
<!--header-->
<div class="body">
    <div id="head">
        <div class="logo">
            <a href="index.jsp">
                <img src="images/logo.p.png" alt="" ></a> <i>免费注册账号</i>
                <span id="logn_right">
                    已有账号？
                    <a href="login.jsp">
                        <input type="button" value="登录"></a>
                </span>
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
    <!---->
    <div class="content">
        <div class="register">

            <%
                //request.setCharacterEncoding("GBK");
                if(session.getAttribute("User")!=null){
            %><h1>已登陆，不能注册</h1><%
        }else{
        %>
            <form action="RegisterServlet" method="post" onSubmit="return validate(this)">
                <div class="regitm">
                    <label>
                        <span>真实姓名：</span>
                        <input type="text" class="text" name="userRealName" required="required"/>
                    </label>
                    <p class="msg"> <i class="ati"></i>
                        5-25个字符，一个汉字为两个字符
                    </p>
                </div>
                <div class="regitm">
                    <label>
                        <span>手&nbsp;&nbsp;机&nbsp;&nbsp;号：</span>
                        <input type="text" class="text" name="userTelePhone" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        请输入有效手机号
                    </p>
                </div>
                <div id="eMail" class="regitm">
                    <label>
                        <span>邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</span>
                        <input type="text" class="text" name="email" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        请输入有邮箱号
                    </p>
                </div>
                <div>
                    <label>
                        <span>登录密码：</span>
                        <input type="password" class="text"  value="" name="userPassWord" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="err"></i>
                        4-25个字符，一个汉字为两个字符
                    </p>
                </div>
                <div style="margin:0 0 10px">
                    <label>
                        <span></span> <em class="active">弱</em> <em>中</em>
                        <em>强</em>
                    </label>
                </div>
                <div class="regitm">
                    <label>
                        <span>确认密码：</span>
                        <input type="password" class="text" disabled="" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        请再输入一次
                    </p>
                </div>

                <div>
                    <input class="submitBtn btn" type="submit" value="注册" disabled=""/>
                </div>
            </form>
            <%
                }
            %>

        </div>

        <!---->
        <div class="clearfix"></div>
    </div>
    <!---->
    <div class="footer" id="footer">
        <div class="container">
            <p class="footer-grid" id="footer-grid">
                ——·吉林大学商品交易平台·——
                <br>Copyright &copy; 2015.JLU.You come I go.</p>
        </div>
    </div>
</div>
</body>
</html>