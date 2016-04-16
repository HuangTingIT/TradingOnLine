<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="TOL.VO.User" %>
<%@ page contentType="text/html" pageEncoding="GBK" %>
<jsp:include page="info.jsp"/>


<html>
<head>
    <title>Contact</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <link href="css/addinfo.css" rel="stylesheet" type="text/css" media="all"/>
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
    <script type="text/javascript" src="js/addInfo.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 1000);
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

    <div class="col">
        <%
            User user = (User) session.getAttribute("User");
        %>

        <form action="AddInfoServlet" method="post" enctype="multipart/form-data">
            <div class="hp-user-info">
                <div class="hd">
                    <p>
                        <%
                            if ((user.getIcon() == null)) {
                        %> <img class="user-pic" src="icon/default.jpg" width="100" border="none">
                        <% } else {
                        %><img class="user-pic" src="pic.jsp" width="100" border="none"><%
                        }
                    %>
                        更换头像:
                        <a href="#" id="change">
                            <input type="file" style="float: right;margin: 40px 0 0 5px;" name="Icon" value="更换头像" >
                        </a></p>
                </div>
                <div class="bd">
                    <a href="/ShowUserInfoServlet"><input class="submitBtn btn" type="submit" value="保存修改"></a>
                </div>
            </div>

            <div class="contact-grid">
                <div>
                    <label>
                        <span class="item">用户id:</span>
                        <%=user.getUserId()%>
                    </label>
                </div>


                <div>
                    <label>
                        <span class="item">昵&nbsp;称:</span>
                        <input type="text" name="NickName" required="" value=<%=user.getNickName()%>>
                    </label>

                    <p class="msg"><i class="ati"></i>
                        2-25个字符，一个汉字为两个字符
                    </p>
                </div>

                <div>
                    <label>
                        <span class="item">姓&nbsp;名:</span>
                        <input type="text" name="RealName" value=<%=user.getRealName()%>></label>

                    <p class="msg"><i class="ati"></i>
                        4-25个字符，一个汉字为两个字符
                    </p>
                </div>


                <div>
                    <label>
                        <span class="item">
                            <%
                                if (user.getSex() == null || user.getSex() == "") {
                            %>性&nbsp;别:</span>
                        <input type="radio" value="Male" name="Sex" checked="">
                        男 &nbsp;
                        <input type="radio" value="Female" name="Sex">女</label>

                    <% } else {
                        if (user.getSex().equals("男")) {
                    %>
                    性&nbsp;别:</span><input type="radio" value="Male" name="Sex" checked>男 &nbsp;<input type="radio" value="Female" name="Sex">女</label>
                    <%} else {%>
                    性&nbsp;别:</span><input type="radio" value="Male" name="Sex">男 &nbsp;<input type="radio" value="Female" name="Sex" checked>女</label>
                    <%
                            }
                        }
                    %>


                </div>

                <div>
                    <label>
                        <span class="item">手机号:</span>
                        <input type="text" name="TelePhone" value=<%=user.getTelephone()%>></label>

                    <p class="msg">
                        <i class="ati"></i>
                        请填写有效手机号
                    </p>
                </div>

                <div>
                    <label>
                        <span class="item">邮&nbsp;箱:</span>
                        <input type="text" name="Email" value=<%=user.getEmail()%>></label>

                    <p class="msg">
                        <i class="ati"></i>
                        请填写有效邮箱
                    </p>
                </div>


            </div>

            <div class="clearfix"></div>
        </form>
    </div>
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
