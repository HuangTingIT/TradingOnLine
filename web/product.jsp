<%@ page contentType="text/html;charset=GBK" language="java" %>
<%@ page import="TOL.VO.Goods" %>
<%@ page import="java.util.ArrayList" %>

<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 17:11
  To change this template use File | Settings | File Templates.

  <c:foreach var="goods" items="${sessionScope.GoodsList}" varStatus="goodsCount">
    ��Ʒ����:${goods}<br>
    ����:${goods.categor}<br>
    ����:${goods.num}<br>
    �۸�:${goods.price}<br>
    ����:${goods.description}<br>
    ��ַ:${goods.address}<br>
    �������:${goods.vew_num}<br>
    ͼƬ��
</c:foreach>
--%>



<html>
<head>
    <title>Products</title>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="js/jquery.min.js"></script>
    <!-- Custom Theme files -->
    <!--theme-style-->
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <!--//theme-style-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=GBK"/>
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
    <link href='http://fonts.useso.com/css?family=Lato:100,300,400,700,900' rel='stylesheet' type='text/css'>
    <link href='http://fonts.useso.com/css?family=Vollkorn:400,700' rel='stylesheet' type='text/css'>
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

    <script>
        function checklogin(userid)
        {
            var id = userid;
            if(id==null)
            {
                alert("���ȵ�¼!");
                return false;
            }
            else
            {
                return true;
            }
        }
    </script>
</head>
<body>
<!--header-->
<jsp:include page="header.jsp"/>

<!---->
<div class="container">
    <div class="content-top top-product">
        <h5 class="welcome">��ӭ���� ��������</h5>

        <div class="search">
            <form action="SearchServlet" method="post" style="margin-bottom: 1px">
                <%
                    //request.setCharacterEncoding("GBK");
                %>
                <input type="text" name="keyword" value="Search" onFocus="this.value = '';"
                       onBlur="if (this.value == '') {this.value = '';}">
                <input type="submit" value="" name="search">
            </form>
        </div>
        <div class="clearfix"></div>
    </div>
    <!---->


    <%
        //request.setCharacterEncoding("GBK");
        if (session.getAttribute("judge_addGoods") != null && (boolean) session.getAttribute("judge_addGoods") == true) {
    %>
    <h1>��Ʒ��ӳɹ�</h1>
    <%
        }
    %>
    <%
        ArrayList<Goods> goodsList = (ArrayList<Goods>) session.getAttribute("GoodsList");
        if (goodsList == null || (goodsList.size() == 0)) {
    %><h1>δ�����������Ʒ</h1>

    <%
    } else {
        for (int i = 0; i < goodsList.size(); i++) {
            System.out.print(goodsList.size());
            Goods goods = goodsList.get(i);

    %>
    <div class="col-md-4 bottom-content ten">
        <a href="single.jsp?goodsId=<%=goods.getGoodsID()%>">

            <%
                String publicPath = "GoodsPictures/";
                String path[] = goods.getPictures().split(";");
                String filePath = publicPath + path[0];

            %>
            <div style="height:370px;width:370px;overflow: hidden"> <img style ="height: 100%" class="img-responsive" src="<%=filePath%>" alt=""></div>

            <p class="tun"><%=goods.getName()%>
            </p>

            <p class="number">�۸�<span><%=goods.getPrice()%></span></p>

            <p class="best">BEST <span>SELLER</span></p>

            <div class="pro-grid">
                <div class="pro-btns">

                    <form action="AddGoodsServlet" method="post">
                        <input type="hidden" value=<%=goods.getUserId()%> name="userid">
                        <input type="hidden" value=<%=goods.getGoodsID()%> name="goodsid">
                    </form>
                </div>
            </div>
        </a>
    </div>

    <%
            }
        }
    %>


    <!---->

    <!---->
    <div class="clearfix"></div>
</div>

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
    <a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</div>

</body>
</html>