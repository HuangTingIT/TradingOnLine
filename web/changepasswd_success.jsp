<%--
  Created by IntelliJ IDEA.
  User: Satan
  Date: 2016/1/9
  Time: 10:12
  To change this template use File | Settings | File Templates.
--%>



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
    <title>�����޸ĳɹ�</title>
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
    <meta name="description" content="���������������ִ�ѧ��Ʒ����ƽ̨��Ϊʦ���ṩ��Ʒ���ף������ֽ��ף�������Ʒ����Ϣ���������������ࡢ��ģС���ص㡣���������������˼�ʱ����ݡ���ȫ����Ʒ����ƽ̨��">
    <meta name="keywords" content="���󣬼�����֣�����2�֣�������ֽ��ף��������ã����󽻻���������Ʒ�г���������ɧ����������" />
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
            <img src="images/logo.p.png" alt="" ></a> <i>��½�˺�</i>
    </div>
    <div class="clearfix"></div>
</div>
<!---->

<!---->
<div class="content">
    <div id="logingif">
        <img src="images/9.gif" alt=""></div>
    <div class="container" id="container" style="padding: 10px;margin-top: 55px;">


        <center style="padding: 15px;" id="login-right">
            <h2>
                �����޸ĳɹ���
                <time id="t">3</time>
                ����Զ���ת����½ҳ��
            </h2>
            <h2>
                <a href="login.jsp" style="color:red;">���Ϊ��ת�����������ֶ���ת</a>
            </h2>
        </center>
        <%
            response.setHeader("refresh","3;url=login.jsp");
        %>




        <div class="clearfix"></div>

    </div>
</div>
<script type="text/javascript">
    function run(){
        var s = document.getElementById("t");
        if(s.innerHTML == 0){
            window.location.href='index.jsp';
            return false;
        }
        s.innerHTML = s.innerHTML - 1;
    }
    window.setInterval("run();", 1000);
</script>
<!---->
<div id="footer">
    <p id="footer-grid">
        ���������ִ�ѧ��Ʒ����ƽ̨������
        <br>Copyright &copy; 2015.JLU.You come I go.</p>


</div>
</body>
</html>