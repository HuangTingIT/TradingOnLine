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
    <title>��������</title>
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
    <meta name="description" content="���������������ִ�ѧ��Ʒ����ƽ̨��Ϊʦ���ṩ��Ʒ���ף������ֽ��ף�������Ʒ����Ϣ���������������ࡢ��ģС���ص㡣���������������˼�ʱ����ݡ���ȫ����Ʒ����ƽ̨��">
    <meta name="keywords" content="���󣬼�����֣�����2�֣�������ֽ��ף��������ã����󽻻���������Ʒ�г���������ɧ����������" />
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
    %><h1>��δ��¼</h1><%
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
            <a href="addInfo.jsp"><input type="button" class="submitBtn btn" value="�༭����"></a>
        </div>
    </div>

    <div class="contact-grid">
        <table>
            <tr>
                <td class="thead">�û�id:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getUserId()%></td>
            </tr>
            <tr>
                <td class="thead">��&nbsp;��:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getNickName()%></td>
            </tr>
            <tr>
                <td class="thead">��&nbsp;��:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getRealName()%></td>
            </tr>
            <tr>
                <td class="thead">��&nbsp;��:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getSex()%></td>
            </tr>
            <tr>
                <td class="thead">�ֻ���:</td>
                <td>&nbsp;<%=((User) session.getAttribute("User")).getTelephone()%></td>
            </tr>
            <tr>
                <td class="thead">��&nbsp;��:</td>
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
            ���������ִ�ѧ��Ʒ����ƽ̨������
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