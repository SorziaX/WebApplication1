<%-- 
    Document   : addcard
    Created on : 2018/12/13, 14:09:07
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
        <title>CGSS TAKE MY MONEY</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form method="post" action="addcard.jsp" accept-charset="UTF-8">
        <a href="cardlist.jsp">返回一览</a>
        <br>
        卡片名称:<br>
        <input type="text" name="card_name">
        <br>
        角色编号:<br>
        <input type="text" name="chara_id">
        <br>
        稀有度:<br>
        <input type="radio" name="rarity_id" value="1">N
        <input type="radio" name="rarity_id" value="2">R
        <input type="radio" name="rarity_id" value="3">SR
        <input type="radio" name="rarity_id" value="4">SSR
        <br><br>
        <input type="submit" value="submit">
                
        <div style="display:none;width:700px;height:100px;background-color:#AAAAAA;"><!--隐藏-->
            
        
        </div> 
        
        <div style="display:block;width:700px;height:100px;background-color:#AAAAAA;"><!--显示-->
            
            
        </div> 
        
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

        </form>
    </body>
</html>
