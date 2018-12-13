<%-- 
    Document   : addcard
    Created on : 2018/11/09, 15:13:06
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.sql.Date" %> 
<%@ page import="cgsslog.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
    </head>
        <body>
        <%
        request.setCharacterEncoding("UTF-8");
        String cardName=request.getParameter("card_name");
        int charaId=Integer.parseInt(request.getParameter("chara_id"));
        int rarityId=Integer.parseInt(request.getParameter("rarity_id"));
        String a=null;
        Date birthday=null;
        System.out.println(cardName);
        System.out.println(charaId);
        System.out.println(rarityId);
        /* 
        try
        {
        Type type = new Type(0,a);
        Seiza seiza = new Seiza(0,a);
        Hometown home = new Hometown(0,a,a);
        Rarity rarity = new Rarity(rarityId,a);
        CardGetMethod get = new CardGetMethod(0,a);
        Skill skill = new Skill(0,a);
        CharaMaster chara = new CharaMaster(charaId, a, a, a, type, 0, 0, 0, birthday, seiza, home, a, a, a);
        CardMaster card = new CardMaster(0, cardName, chara, rarity, get, skill);
        CardMasterDAO dao = new CardMasterDAO();

        dao.addCard(card);

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
        */
        %>
        </body>
</html>

