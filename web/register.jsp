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
    <title>ע��</title>
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
<div class="body">
    <div id="head">
        <div class="logo">
            <a href="index.jsp">
                <img src="images/logo.p.png" alt="" ></a> <i>���ע���˺�</i>
                <span id="logn_right">
                    �����˺ţ�
                    <a href="login.jsp">
                        <input type="button" value="��¼"></a>
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
            %><h1>�ѵ�½������ע��</h1><%
        }else{
        %>
            <form action="RegisterServlet" method="post" onSubmit="return validate(this)">
                <div class="regitm">
                    <label>
                        <span>��ʵ������</span>
                        <input type="text" class="text" name="userRealName" required="required"/>
                    </label>
                    <p class="msg"> <i class="ati"></i>
                        5-25���ַ���һ������Ϊ�����ַ�
                    </p>
                </div>
                <div class="regitm">
                    <label>
                        <span>��&nbsp;&nbsp;��&nbsp;&nbsp;�ţ�</span>
                        <input type="text" class="text" name="userTelePhone" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        ��������Ч�ֻ���
                    </p>
                </div>
                <div id="eMail" class="regitm">
                    <label>
                        <span>��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�䣺</span>
                        <input type="text" class="text" name="email" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        �������������
                    </p>
                </div>
                <div>
                    <label>
                        <span>��¼���룺</span>
                        <input type="password" class="text"  value="" name="userPassWord" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="err"></i>
                        4-25���ַ���һ������Ϊ�����ַ�
                    </p>
                </div>
                <div style="margin:0 0 10px">
                    <label>
                        <span></span> <em class="active">��</em> <em>��</em>
                        <em>ǿ</em>
                    </label>
                </div>
                <div class="regitm">
                    <label>
                        <span>ȷ�����룺</span>
                        <input type="password" class="text" disabled="" required="required"/>
                    </label>
                    <p class="msg">
                        <i class="ati"></i>
                        ��������һ��
                    </p>
                </div>

                <div>
                    <input class="submitBtn btn" type="submit" value="ע��" disabled=""/>
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
                ���������ִ�ѧ��Ʒ����ƽ̨������
                <br>Copyright &copy; 2015.JLU.You come I go.</p>
        </div>
    </div>
</div>
</body>
</html>