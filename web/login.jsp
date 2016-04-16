<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="GBK" %>
<%@ page import="java.util.*" %>
<jsp:include page="info.jsp"/>
<html>
<head><title>TradingOnLine</title></head>
<body>

</body>
</html>


<html>
<head>
    <title>登录</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link rel="stylesheet" href="css/login.css" type="text/css" media="all">
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

</head>
<body>
<!--header-->
<div id="head">
    <div class="logo" id="logo">
        <a href="index.jsp">
            <img src="images/logo.p.png" alt="" ></a> <i>登陆账号</i>
    </div>
    <div class="clearfix"></div>
</div>
<!---->

<!---->
<div class="content">
    <div id="logingif">
        <img src="images/9.gif" alt=""></div>
    <div class="container" id="container">
        <div class="col-md-6 login-left">
            <a class="acount-btn" href="register.jsp">注册</a>
        </div>
        <div id="login-right">

            <script language="javascript">
                function validateTelePhone(tel){
                    if(!(/\d{4}/.test(tel))){
                        document.getElementById("empno_msg").innerHTML = "<img src=\""+url+"/images/wrong.gif\">" + "<font color=\"red\">雇员编号必须是四位的数字！</font>" ;
                        return false ;
                    } else {
                        document.getElementById("empno_msg").innerHTML = "<img src=\""+url+"/images/right.gif\">" + "<font color=\"green\">雇员编号输入正确！</font>" ;
                        return true ;
                    }
                }
                function validate(f) {
                    if (!(/^\w{1,15}$/.test(f.userId.value))) {
                        alert("用户ID必须是5~15位！");
                        f.userid.focus();
                        return false;
                    }
                    if (!(/^\w{5,15}$/.test(f.userPassWord.value))) {
                        alert("密码必须是5~15位！");
                        f.userpass.focus();
                        return false;
                    }
                    var judge = loadXMLDoc();
                }
            </script>
            <%
                //request.setCharacterEncoding("GBK");
                if(session.getAttribute("User")!=null){
            %><h1>已经登陆了，不能重新登陆</h1><%
            // request.getRequestDispatcher("index.jsp").forward(request,response);
        }else{
        %>
            <form action="LoginServlet" method="post" onSubmit="return validate(this)">
                <div class="infield">
                    <div>
                        <input  type="text" placeholder="手机号" name="telePhone"></div>
                    <div>
                        <input  type="password" placeholder="密码" onfocus="this.value=''" name="userPassWord"></div>
                </div>
                <div id="forget">
                    <a class="forgot" href="FindCode.jsp">忘记密码？</a>
                </div>
                <div class="submit">
                    <input type="submit" value="登录"></div>
            </form>

            <%
                }
            %>


        </div>

        <div class="clearfix"></div>

    </div>
</div>
<!---->
<div id="footer">
    <p id="footer-grid">
        ——·吉林大学商品交易平台·——
        <br>Copyright &copy; 2015.JLU.You come I go.</p>


</div>
</body>
<%
    if(request.getAttribute("info")!=null){
        ArrayList<String> info = (ArrayList<String>) request.getAttribute("info");
        if(info.get(info.size()-1).equals("false")){
%>
<script>
    alert("用户名或密码错误，请核对后重新输入");
</script>
<%
        }
    }
%>
</html>