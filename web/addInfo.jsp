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
    <meta name="description" content="���������������ִ�ѧ��Ʒ����ƽ̨��Ϊʦ���ṩ��Ʒ���ף������ֽ��ף�������Ʒ����Ϣ���������������ࡢ��ģС���ص㡣���������������˼�ʱ����ݡ���ȫ����Ʒ����ƽ̨��">
    <meta name="keywords" content="���󣬼�����֣�����2�֣�������ֽ��ף��������ã����󽻻���������Ʒ�г���������ɧ����������" />
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
                        ����ͷ��:
                        <a href="#" id="change">
                            <input type="file" style="float: right;margin: 40px 0 0 5px;" name="Icon" value="����ͷ��" >
                        </a></p>
                </div>
                <div class="bd">
                    <a href="/ShowUserInfoServlet"><input class="submitBtn btn" type="submit" value="�����޸�"></a>
                </div>
            </div>

            <div class="contact-grid">
                <div>
                    <label>
                        <span class="item">�û�id:</span>
                        <%=user.getUserId()%>
                    </label>
                </div>


                <div>
                    <label>
                        <span class="item">��&nbsp;��:</span>
                        <input type="text" name="NickName" required="" value=<%=user.getNickName()%>>
                    </label>

                    <p class="msg"><i class="ati"></i>
                        2-25���ַ���һ������Ϊ�����ַ�
                    </p>
                </div>

                <div>
                    <label>
                        <span class="item">��&nbsp;��:</span>
                        <input type="text" name="RealName" value=<%=user.getRealName()%>></label>

                    <p class="msg"><i class="ati"></i>
                        4-25���ַ���һ������Ϊ�����ַ�
                    </p>
                </div>


                <div>
                    <label>
                        <span class="item">
                            <%
                                if (user.getSex() == null || user.getSex() == "") {
                            %>��&nbsp;��:</span>
                        <input type="radio" value="Male" name="Sex" checked="">
                        �� &nbsp;
                        <input type="radio" value="Female" name="Sex">Ů</label>

                    <% } else {
                        if (user.getSex().equals("��")) {
                    %>
                    ��&nbsp;��:</span><input type="radio" value="Male" name="Sex" checked>�� &nbsp;<input type="radio" value="Female" name="Sex">Ů</label>
                    <%} else {%>
                    ��&nbsp;��:</span><input type="radio" value="Male" name="Sex">�� &nbsp;<input type="radio" value="Female" name="Sex" checked>Ů</label>
                    <%
                            }
                        }
                    %>


                </div>

                <div>
                    <label>
                        <span class="item">�ֻ���:</span>
                        <input type="text" name="TelePhone" value=<%=user.getTelephone()%>></label>

                    <p class="msg">
                        <i class="ati"></i>
                        ����д��Ч�ֻ���
                    </p>
                </div>

                <div>
                    <label>
                        <span class="item">��&nbsp;��:</span>
                        <input type="text" name="Email" value=<%=user.getEmail()%>></label>

                    <p class="msg">
                        <i class="ati"></i>
                        ����д��Ч����
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
