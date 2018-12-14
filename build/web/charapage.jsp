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
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="page">   <!--大框架开始-->
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
        
            <div class="box">   <!--左栏开始-->
                角色信息
                <ul>
                    <li>姓名（汉字）：<%=cm.getNameKanji() %></li>
                    <li>姓名（假名）：<%=cm.getNameKana()%></li>
                    <li>姓名（罗马音）：<%=cm.getNameRomaji()%></li>
                    <li>属性：<%=cm.type.getName()%></li>
                    <li>身高：<%=cm.getHeight()%></li>
                    <li>年龄：<%=cm.getAge()%></li>
                    <li>体重：<%=cm.getWeight()%></li>
                    <li>生日：
                        <%
                        Date birthday = cm.getBirthday();
                        SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
                        String NewDate = sdf.format(birthday);
                        out.print(NewDate);
                        %>
                    </li>
                <li>星座：<%=cm.seiza.getName()%></li>
                <li>出身地：<%=cm.hometown.getCountry() + cm.hometown.getProvince()%></li>
                <li>兴趣：<%=cm.getHobby()%></li>
                <li>CV：<%=cm.getCv()%></li>
                <li>备注：<%=cm.getNote()%></li>
                </ul>
            </div>  <!--左栏结束-->
            
            <div class="box">   <!--右栏开始-->
                持有卡片
                <br>
                <table>
                <tr>
                    <th>卡片名</th>
                    <th>稀有度</th>
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
                </table>
                
            </div>   <!--右栏结束-->
                
        </div>  <!--大框架结束-->
    </body>
</html>
