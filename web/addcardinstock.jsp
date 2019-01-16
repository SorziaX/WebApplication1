<%-- 
    Document   : addcardinstock
    Created on : 2019/01/16, 13:02:49
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %> 
<%@ page import="cgsslog.*, cgsslog.DAO.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <%
            int cardId = Integer.parseInt(request.getParameter("id"));
            CardMasterDAO dao = new CardMasterDAO();
            CardMaster cdm = dao.selectCard(cardId);
        %>
        <form method="post" action="cardinstock.jsp" accept-charset="UTF-8">
            <button type="submit" value="submit"">确定</button>
            <table border ="1">
                <tr>
                    <td>卡片名</td>
                    <td>角色名</td>
                    <td>稀有度</td>
                    <td>StarRank</td>
                    <td>技能等级</td>
                    <td>特训</td>
                    <td>满级</td>
                    <td>亲密度</td>
                </tr>
                    <td><%=cdm.getCardName() %></a></td>
                    <td><%=cdm.charaMaster.getNameKanji()%></td>
                    <td><%=cdm.rarity.getName() %></td>
                    <td><input type="text" name="star_rank"></td>
                    <td><input type="text" name="skill_level"></td>
                    <td>
                        <input type="radio" name="tokkun_flag" value="ture">特训后
                        <input type="radio" name="tokkun_flag" value="false">特训前
                    </td>
                    <td>
                        <input type="radio" name="maxlevel_flag" value="ture">Yes
                        <input type="radio" name="maxlevel_flag" value="false">No
                    </td>
                    <td>
                        <input type="radio" name="maxshinmitsu_flag" value="ture">Max
                        <input type="radio" name="maxshinmitsu_flag" value="false">No
                    </td>
                </tr>
        </form>
        <%
        request.setCharacterEncoding("UTF-8");    
        String starRankString =request.getParameter("star_rank");
        System.out.println("debug1");
        System.out.println(starRankString);
        
        if( starRankString != null){
            
            System.out.println("debug2");
            
            int skillLevel=Integer.parseInt(request.getParameter("skill_level"));
            int starRank=Integer.parseInt(request.getParameter("star_rank"));
            boolean tokkunFlag=Boolean.parseBoolean(request.getParameter("tokkun_flag")); 
            boolean maxLevelFlag=Boolean.parseBoolean(request.getParameter("maxlevel_flag")); 
            boolean maxShinmitsuFlag=Boolean.parseBoolean(request.getParameter("maxshinmitsu_flag")); 
            
            try
            {
            CardInStockDAO dao2 = new CardInStockDAO();
            CardInStock cis = new CardInStock(0, cdm, starRank, skillLevel,
                            tokkunFlag, maxLevelFlag, maxShinmitsuFlag);
            dao2.addCardInStock(cis);
            }
            catch(Exception e)
            {
            e.printStackTrace();
            }
        }
        %>
    </body>
</html>
