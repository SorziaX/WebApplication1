<%-- 
    Document   : cardlist
    Created on : 2019/01/28, 10:01:01
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <div class="card-list">
                <%
                    CardMasterDAO dao = new CardMasterDAO();
                    List<CardMaster> list = dao.readCard();
                    
                    CardInStockDAO dao2 = new CardInStockDAO();
                    
                    for(CardMaster cm:list)
                    {%>
                    <div class="card-line">
                        <div class="card-one">
                        <div id="card-id"><%=cm.getId() %></div>
                            <div id="card-image" style="background-image:url(image/card/card_<%=cm.getId()%>_icon.jpg"></div>
                            <div id="card-name"><a href="cardpage.jsp?id=<%=cm.getId()%>"><%=cm.getCardName() %></a></div>
                            <div id="rarity">    
                                <%
                                    if(cm.rarity.getId()==1){
                                {%>
                                        <div id="cardRarity-N"><%=cm.rarity.getName()%></div>           
                                <%}
                                    }else if(cm.rarity.getId()==2){
                                {%>
                                        <div id="cardRarity-R"><%=cm.rarity.getName()%></div>           
                                <%}
                                    }else if(cm.rarity.getId()==3){
                                {%>
                                        <div id="cardRarity-SR"><%=cm.rarity.getName()%></div>           
                                <%}
                                    }else if(cm.rarity.getId()==4){
                                {%>
                                        <div id="cardRarity-SSR"><%=cm.rarity.getName()%></div>           
                                <%}
                                    }
                                %>
                            </div>
                            <div id="cardAmount">持有<%=dao2.countCard(cm.getId())%>张</div>
                            <div id="nameKanji"><a href="charalist.jsp?id=<%=cm.charaMaster.getId()%>"><%=cm.charaMaster.getNameKanji() %></a></div>
                        <div id="addCard">
                            <form method="post" action="addcardinstock.jsp?id=<%=cm.getId()%>" accept-charset="UTF-8">
                                <button type="submit" value="submit"">添加</button>
                            </form>
                        </div>  
                        </div>
                    </div>
                    <%}

                 %>
            </div>
        </div>
    </body>
</html>
