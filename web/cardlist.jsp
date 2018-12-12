<%-- 
    Document   : cardlist
    Created on : 2018/11/09, 14:37:45
    Author     : shenhanfei
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.CardMasterDAO,cgsslog.CardMaster" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
    </head>
    <body>
            <a href="index.html">返回</a>
            <a href="addcard.html">添加卡牌</a>

            <table border ="1">
                <tr>
                    <td>ID</td>
                    <td>卡片名</td>
                    <td>角色名</td>
                    <td>稀有度</td>
                </tr>
                
                <%
                    CardMasterDAO dao = new CardMasterDAO();
                    List<CardMaster> list = dao.readCard();
                    for(CardMaster cm:list)
                    {%>
                    <tr>
                        <td><%=cm.getId() %></td>
                        <td><%=cm.getCardName() %></td>
                        <td><%=cm.charaMaster.getNameKanji() %></td>
                        <td><%=cm.rarity.getName() %></td>
                    </tr>
                    <%}

                 %>
    </body>
</html>
