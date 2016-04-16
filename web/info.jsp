<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/21
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%
    //request.setCharacterEncoding("GBK");
    List<String> info = (List<String>) request.getAttribute("info");
    if (info != null) {    // 有信息返回
        Iterator<String> iter = info.iterator();
        while (iter.hasNext()) {
%>
<h4><%=iter.next()%>
</h4>
<%
        }
    }
%>
</body>
</html>
