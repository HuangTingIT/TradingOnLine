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
                <!--<li><a href="ShowUserInfoServlet">我的账号</a></li>
                |-->
                <li><a href="CheckOutServlet"> 购物车 </a></li>
                |
                <%
                    if(session.getAttribute("User")==null)
                    {
                %>
                <li><a href="login.jsp">登录</a></li>
                |
                <li><a href="register.jsp"> 注册</a></li>
                |
                <%
                }
                else
                {
                %>
                <li><a href="ShowUserInfoServlet"> 我的账号</a></li>
                |
                <%
                    }
                %>
                <li><a href="LogoutServlet"> 退出</a></li>
                |
                <li><a href="addInfo.jsp"> 修改用户信息</a></li>
            </ul>
            <div class="header-bottom">
                <div class="top-nav">
                    <span class="menu"> </span>
                    <ul>
                        <li class="active"><a href="index.jsp">首页</a></li>
                        <li><a href="releaseGoods.jsp">发布商品</a></li>
                        <li><a href="ShowMyGoodsServlet">我的商品</a></li>

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
