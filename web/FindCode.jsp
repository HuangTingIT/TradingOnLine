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
    <title>�һ�����</title>
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
    <meta name="description" content="���������������ִ�ѧ��Ʒ����ƽ̨��Ϊʦ���ṩ��Ʒ���ף������ֽ��ף�������Ʒ����Ϣ���������������ࡢ��ģС���ص㡣���������������˼�ʱ����ݡ���ȫ����Ʒ����ƽ̨��">
    <meta name="keywords" content="���󣬼�����֣�����2�֣�������ֽ��ף��������ã����󽻻���������Ʒ�г���������ɧ����������" />
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
            <img src="images/logo.p.png" alt="" ></a> <i>�һ�����</i>
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
            <div class="finditm" style="margin-top: 1.3em;">����:</div>
            <input type="text" class="input title" name="Email" onblur="MailAjax()" value="">
            <p class="msg" id="emailJudge" name="judge"> <i class="ati"></i>
                5-25���ַ���һ������Ϊ�����ַ�
            </p>
            <div id="sendiv">
                <span id="sendsp" class="submitBtn btn" disabled="" onclick="sendnum();sendCodeAjax()">������֤��</span>
            </div>
            <div id="sendiv">
                <span id="sendsp2" class="submitBtn btn" style="display: none"><time id="t">60</time>s�����·���</span>
            </div>
            <form action="ChangePassWord.jsp" id="form2">
                <div class="finditm">��֤��:</div>
                <input type="text" name="Code" disabled="" onblur="judgeCode()"/>
                <p class="msg" id="codeTip"> <i class="ati"></i>
                    5-25���ַ���һ������Ϊ�����ַ�
                </p>
                <div>
                    <input type="submit" id="sub" class="submitBtn btn" value="��һ��" disabled="" />
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
        ���������ִ�ѧ��Ʒ����ƽ̨������
        <br>Copyright &copy; 2015.JLU.You come I go.</p>

</div>
</body>
</html>