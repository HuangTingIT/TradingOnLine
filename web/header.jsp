<%--
  Created by IntelliJ IDEA.
  User: Satan
  Date: 2016/1/9
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=GBK" language="java" %>
<div class="header">
    <div class="container">
        <!---->
        <div class="logo">
            <a href="index.jsp"><img src="images/logo.png" alt=""></a>
        </div>
        <div class="header-right">
            <ul class="account">
                <!--<li><a href="ShowUserInfoServlet">�ҵ��˺�</a></li>
                |-->
                <li><a href="CheckOutServlet"> ���ﳵ </a></li>
                |
                <%
                    if(session.getAttribute("User")==null)
                    {
                %>
                <li><a href="login.jsp">��¼</a></li>
                |
                <li><a href="register.jsp"> ע��</a></li>
                |
                <%
                }
                else
                {
                %>
                <li><a href="ShowUserInfoServlet"> �ҵ��˺�</a></li>
                |
                <%
                    }
                %>
                <li><a href="LogoutServlet"> �˳�</a></li>
                |
                <li><a href="addInfo.jsp"> �޸��û���Ϣ</a></li>
            </ul>
            <div class="header-bottom">
                <div class="top-nav">
                    <span class="menu"> </span>
                    <ul>
                        <li class="active"><a href="index.jsp">��ҳ</a></li>
                        <li><a href="releaseGoods.jsp">������Ʒ</a></li>
                        <li><a href="ShowMyGoodsServlet">�ҵ���Ʒ</a></li>

                    </ul>


                    <!--script-->
                    <script>
                        $("span.menu").click(function () {
                            $(".top-nav ul").slideToggle(500, function () {
                            });
                        });
                    </script>
                </div>

                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
