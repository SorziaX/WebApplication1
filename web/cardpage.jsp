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
        
        <br><br>
                卡片信息
                <ul>
                    <li>卡片名称：<%=cdm.getCardName()%></li>
                    <li>角色名称：<%=cdm.charaMaster.getNameKanji()%></li>
                    <li>稀有度：<%=cdm.rarity.getName()%></li>
                    <li>获取方式：<%=cdm.cardGetMethod.getName()%></li>
                    <li>技能：<%=cdm.skill.getName()%></li>
                </ul>
            </div>  <!--左栏结束-->
        </div>  <!--大框架结束-->
    </body>
</html>
