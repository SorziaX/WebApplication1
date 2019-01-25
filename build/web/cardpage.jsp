<%-- 
    Document   : cardpage
    Created on : 2019/01/16, 10:03:44
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.DAO.*, cgsslog.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%  
            request.setCharacterEncoding("UTF-8");
            int cardId = Integer.parseInt(request.getParameter("id"));  
            CardMasterDAO dao = new CardMasterDAO();
            CardMaster cdm = dao.selectCard(cardId);
        %>
        <div class="page">   <!--大框架开始-->
        <a href="cardlist.jsp">返回一览</a>
        <a href="cardedit.jsp?id=<%=cardId%>">修改卡片信息</a>
        
        <br>
                <h2>卡片信息</h2>
                <div id="card-info">
                    卡片名称：<%=cdm.getCardName()%>
                    <br>
                    角色名称：<%=cdm.charaMaster.getNameKanji()%>
                    <br>
                    稀有度：<%=cdm.rarity.getName()%>
                    <br>
                    获取方式：<%=cdm.cardGetMethod.getName()%>
                    <br>
                    技能：<%=cdm.skill.getName()%>
                    <br>
                </ul>
                <br>
                </div>
                特训前
                <div>
                    <%  if (cdm.rarity.getId() > 2){{%>
                        <img src="image/card/card_<%=cardId%>_before.jpg" height="300" width="auto"> 
                    <%} }else{ {%>
                        <img src="image/card/card_<%=cardId%>_before.png" height="300" width="auto"> 
                    <%}}
                    %>
                </div>
                特训后
                <div>
                    <%  if (cdm.rarity.getId() > 2){{%>
                        <img src="image/card/card_<%=cardId%>_after.jpg" height="300" width="auto"> 
                    <%} }else{ {%>
                        <img src="image/card/card_<%=cardId%>_after.png" height="300" width="auto"> 
                    <%}}
                    %>
                </div>
            </div>  <!--左栏结束-->
        </div>  <!--大框架结束-->
    </body>
</html>
