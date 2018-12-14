<%-- 
    Document   : newjsp
    Created on : 2018/11/05, 20:39:25
    Author     : shenhanfei
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="cgsslog.CharaMasterDAO,cgsslog.CharaMaster" %> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
    </head>
    <body>
            <a href="index.html">返回</a>

            <table border ="1">
                <tr>
                    <td>ID</td>
                    <td>名前</td>
                    <td>属性</td>
                </tr>
                
                <%
                    CharaMasterDAO dao = new CharaMasterDAO();
                    List<CharaMaster> list = dao.readChara();
                    for(CharaMaster cm:list)
                    {%>
                    <tr>
                        <td><%=cm.getId() %></td>
                        <td><a href="charapage.jsp?id=<%=cm.getId() %>"><%=cm.getNameKanji() %></a></td>
                        <td><%=cm.type.getName() %></td>
                    </tr>
                    <%}

                 %>
             </table>
        </div>
    </body>
</html>
