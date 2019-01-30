<%-- 
    Document   : cardlist
    Created on : 2018/11/09, 14:37:45
    Author     : shenhanfei
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.DAO.CardMasterDAO,cgsslog.CardMaster" %>
<%@ page import="cgsslog.DAO.CardInStockDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
              <div class="content">
            <nav class="content-menu">
                <ul>
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a href="cardinstock.jsp">持有卡片一览</a>
                    </li>
                    <li>
                        <a href="charalist.jsp">CGSS角色一览</a>
                    </li>
                    <li class="current">
                        <a href="cardlist.jsp">CGSS卡牌一览</a>
                    </li>
                </ul>
            </nav>
            <a href="addcard.jsp">添加卡牌</a>
            <table border ="1">
                <tr>
                    <td>ID</td>
                    <td>卡片名</td>
                    <td>角色名</td>
                    <td>稀有度</td>
                    <td>持有数</td>
                    <td>获取卡片</td>
                </tr>
                
                <%
                    CardMasterDAO dao = new CardMasterDAO();
                    List<CardMaster> list = dao.readCard();
                    
                    CardInStockDAO dao2 = new CardInStockDAO();
                    
                    for(CardMaster cm:list)
                    {%>
                    <tr>
                        <td><%=cm.getId() %></td>
                        <td><a href="cardpage.jsp?id=<%=cm.getId()%>"><%=cm.getCardName() %></a></td>
                        <td><%=cm.charaMaster.getNameKanji() %></td>
                        <td><%=cm.rarity.getName() %></td>
                        <td><%=dao2.countCard(cm.getId())%></td>
                        <td>
                            <form method="post" action="addcardinstock.jsp?id=<%=cm.getId()%>" accept-charset="UTF-8">
                                    <button type="submit" value="submit"">添加</button>
                                </form>
                        </td>
                    </tr>
                    <%}

                 %>
    </div>
    </body>
</html>
