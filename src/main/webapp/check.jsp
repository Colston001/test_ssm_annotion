<%@ page import="java.sql.*" %>
<%@ page import="org.lanqiao.dao.AdminDao" %>
<%--<%@ page import="org.lanqiao.dao.impl.AdminDaoImpl" %>--%>
<%@ page import="org.lanqiao.entity.Admin" %>
<%--
  Created by IntelliJ IDEA.
  User: chenrui
  Date: 2023/7/31
  Time: 下午5:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<body>
<%--    <%--%>
<%--        AdminDao adminDao = new AdminDaoImpl();--%>
<%--        Admin admin = adminDao.longin(new Admin(request.getParameter("uname"), request.getParameter("upwd")));--%>
<%--        if(admin != null){--%>
<%--            session.setAttribute("admin",admin);--%>
<%--            response.sendRedirect("starter.jsp");--%>
<%--        }else{--%>
<%--            response.sendRedirect("login.jsp");--%>
<%--        }--%>
<%--    %>--%>
在线人数：${onLineCount}

<%
//    application

%>
<input type="button" id="bt">
<%--<span datasrc="adminUpdate.jsp">nihao</span>--%>
<%--<div ></div>--%>
</body>

<script>
    // $(function () {
    //     $("#bt").click(function () {
    //         $.ajax({
    //             url: 'getalladmin',
    //             type: 'get',
    //             data: 'name='+"",
    //             success: function (date) {
    //                 $("#bt").html(date);
    //             }
    //         })
    //
    //     })
    // })

</script>
</html>


