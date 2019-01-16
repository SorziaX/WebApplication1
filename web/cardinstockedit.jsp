<%-- 
    Document   : cardlist
    Created on : 2018/11/09, 14:37:45
    Author     : shenhanfei
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.DAO.CardMasterDAO,cgsslog.CardMaster" %>
<%@ page import="cgsslog.DAO.CardInStockDAO, cgsslog.CardInStock" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <br>
        <%
            int cisId = Integer.parseInt(request.getParameter("id"));
            CardMasterDAO dao = new CardMasterDAO();
            List<CardMaster> list = dao.readCard();
                    
            CardInStockDAO dao2 = new CardInStockDAO();
            CardInStock cis = dao2.readCIS(cisId);
        %>
        
        <a href="cardinstock.jsp">返回</a>
        
        <form method="post" action="addcard.jsp" accept-charset="UTF-8">
            <button type="submit" value="submit"">确定</button>
            <table border ="1">
                <tr>
                    <td></td>
                    <td>ID</td>
                    <td>卡片名</td>
                    <td>角色名</td>
                    <td>稀有度</td>
                    <td>StarRank</td>
                    <td>技能等级</td>
                    <td>特训</td>
                    <td>满级</td>
                    <td>亲密度</td>
                </tr>
                <tr>
                    <td>修改前</td>
                    <td><%=cis.getId() %></td>
                    <td><%=cis.cardMaster.getCardName() %></a></td>
                    <td><%=cis.cardMaster.charaMaster.getNameKanji()%></td>
                    <td><%=cis.cardMaster.rarity.getName() %></td>
                    <td><%=cis.getStarRank()%></td>
                    <td><%=cis.getSkillLevel()%></td>
                    <td><%=cis.getTokkunFlag()%></td>
                    <td><%=cis.getMaxLevelFlag()%></td>
                    <td><%=cis.getMaxShinmitsuFlag()%></td>
                    </tr>
                <tr>
                    <td>修改后</td>
                    <td><%=cis.getId() %></td>
                    <td><%=cis.cardMaster.getCardName() %></a></td>
                    <td><%=cis.cardMaster.charaMaster.getNameKanji()%></td>
                    <td><%=cis.cardMaster.rarity.getName() %></td>
                    <td><input type="text" name="star_rank"></td>
                    <td><input type="text" name="skill_level"></td>
                    <td><input type="text" name="tokkun_flag"></td>
                    <td><input type="text" name="maxlevel_flag"></td>
                    <td><input type="text" name="maxshinmitsu_flag"></td>
                </tr>
                </form>
                    
    </body>
</html>
