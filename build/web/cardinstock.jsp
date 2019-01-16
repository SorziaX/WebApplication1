<%-- 
    Document   : cardinstock
    Created on : 2019/01/16, 10:20:48
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.CardInStock,cgsslog.DAO.CardInStockDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
            <a href="index.html">返回</a>

            <table border ="1">
                <tr>
                    <td>ID</td>
                    <td>卡片名</td>
                    <td>角色名</td>
                    <td>稀有度</td>
                    <td>StarRank</td>
                    <td>技能等级</td>
                    <td>特训</td>
                    <td>满级</td>
                    <td>亲密度</td>
                    <td>修改</td>
                </tr>
                
                <%
                    CardInStockDAO dao = new CardInStockDAO();
                    List<CardInStock> list = dao.readCardInStock();
                    for(CardInStock cis:list)
                    {%>
                    <tr>
                        <td><%=cis.getId() %></td>
                        <td><a href="cardpage.jsp?id=<%=cis.cardMaster.getId() %>"><%=cis.cardMaster.getCardName() %></a></td>
                        <td><a href="charapage.jsp?id=<%=cis.cardMaster.charaMaster.getId()%>"><%=cis.cardMaster.charaMaster.getNameKanji()%></a></td>
                        <td><%=cis.cardMaster.rarity.getName() %></td>
                        <td><%=cis.getStarRank()%></td>
                        <td><%=cis.getSkillLevel()%></td>
                        <td><%=cis.getTokkunFlag()%></td>
                        <td><%=cis.getMaxLevelFlag()%></td>
                        <td><%=cis.getMaxShinmitsuFlag()%></td>
                        <td>
                            <form method="post" action="cardinstockedit.jsp?id=<%=cis.getId()%>" accept-charset="UTF-8">
                            <button type="submit" value="submit"">修改</button>
                            </form>
                        </td>
                    </tr>
                    <%}

                 %>
    </body>
</html>
