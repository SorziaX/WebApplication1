<%-- 
    Document   : charapage
    Created on : 2018/12/14, 9:22:18
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.CharaMasterDAO, cgsslog.CharaMaster" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
    </head>
    <body>
        <%  
            String charaId = request.getParameter("id");  
            CharaMasterDAO dao = new CharaMasterDAO();
            CharaMaster chara = dao.readChara();
            
        %>
    </body>
</html>
