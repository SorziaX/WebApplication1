<%-- 
    Document   : charapage
    Created on : 2018/12/14, 9:22:18
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="cgsslog.CharaMasterDAO, cgsslog.CharaMaster, cgsslog.CardMasterDAO,
         cgsslog.CardMaster"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
    </head>
    <body>
        <a href="charalist.jsp">返回一览</a>
        <a href="charaedit.jsp">修改角色信息</a>
        
        <%  
            int charaId = Integer.parseInt(request.getParameter("id"));  
            CharaMasterDAO dao = new CharaMasterDAO();
            CharaMaster cm = dao.selectChara(charaId);
            
            CardMasterDAO dao2 = new CardMasterDAO();
            List<CardMaster> list = dao2.readCharaCard(charaId);
        %>
        <br><br>
        
        姓名（汉字）：<%=cm.getNameKanji() %><br>
        姓名（假名）：<%=cm.getNameKana()%><br>
        姓名（罗马音）：<%=cm.getNameRomaji()%><br>
        属性：<%=cm.type.getName()%><br>
        身高：<%=cm.getHeight()%><br>
        年龄：<%=cm.getAge()%><br>
        体重：<%=cm.getWeight()%><br>
        生日：<%
            Date birthday = cm.getBirthday();
            SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
            String NewDate = sdf.format(birthday);
            out.print(NewDate);
            %><br>
        星座：<%=cm.seiza.getName()%><br>
        出身地：<%=cm.hometown.getCountry() + cm.hometown.getProvince()%><br>
        兴趣：<%=cm.getHobby()%><br>
        CV：<%=cm.getCv()%><br>
        备注：<%=cm.getNote()%><br>
        <br>
        持有卡片
        <br>
        <table border ="1">
                <tr>
                    <td>卡片名</td>
                    <td>稀有度</td>
                </tr>
                <%
                    for(CardMaster cdm:list)
                    {%>
                    <tr>
                        <td><%=cdm.getCardName() %></td>
                        <td><%=cdm.rarity.getName() %></td>
                    </tr>
                    <%}
                %>
                    
    </body>
</html>
