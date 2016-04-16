<%--
  Created by IntelliJ IDEA.
  User: HuangTing
  Date: 2015/12/13
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="TOL.VO.User" %>
<%@ page import="java.io.OutputStream" %>
<%
    User user=(User)session.getAttribute("User");
    response.setContentType("image/jpeg");
    OutputStream os=response.getOutputStream();
    os.write(user.getIcon());
    os.flush();
    os.close();

%>

