<%-- 
    Document   : cardedit
    Created on : 2018/12/14, 11:04:11
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>  
<%@ page import="java.lang.Iterable" %> 
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %>
<%@ page import="cgsslog.CharaMasterDAO, cgsslog.CharaMaster"%>
<%@ page import="cgsslog.TypeDAO, cgsslog.Type"%>
<%@ page import="cgsslog.SeizaDAO, cgsslog.Seiza"%>
<%@ page import="cgsslog.HometownDAO, cgsslog.Hometown"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
            <%  
            int charaId = Integer.parseInt(request.getParameter("id"));  
            CharaMasterDAO dao = new CharaMasterDAO();
            CharaMaster cm = dao.selectChara(charaId);
            
            TypeDAO dao7 = new TypeDAO();
            List<Type> list7 = dao7.readType();
            
            SeizaDAO dao8 = new SeizaDAO();
            List<Seiza> list8 = dao8.readSeiza();
            
            HometownDAO dao9 = new HometownDAO();
            List<Hometown> list9 = dao9.readHome();
            
            %>
        
            <form method="post" action="charaedit.jsp" accept-charset="UTF-8">
            <a href="charapage.jsp?id=<%=charaId%>">返回角色信息</a>
            <br>
            姓名（汉字）
            <input type="text" name="name_Kanji" value="<%=cm.getNameKanji()%>">
            <br>
            姓名（假名）
            <input type="text" name="name_Kana" value="<%=cm.getNameKana()%>">
            <br>
            姓名（罗马音）
            <input type="text" name="name_Romaji" value="<%=cm.getNameRomaji()%>">
            <br>
            属性
            <select name="type_id">
                <% 
                for(Type tp : list7){
                    System.out.println(tp.getId());
                    {%>
                    <option value="<%=tp.getId()%>" <%if(cm.type.getId()==tp.getId()){{%>selected<%}}%>>
                            <%=tp.getName()%>
                        </option>
                    <%}
                }
                %>
            </select>
            <br>
            身高
            <input type="text" name="height" value="<%=cm.getHeight()%>">
            <br>
            年龄
            <input type="text" name="age" value="<%=cm.getAge()%>">
            <br>
            体重
            <input type="text" name="weight" value="<%=cm.getWeight()%>">
            <br>
            生日
            <select name="birth_month">
                
            </select>
            <select name="birth_day">
                
            </select>
            <br>
            星座
            <select name="seiza_id">
            <% 
                for(Seiza sz : list8){
                    System.out.println(sz.getId());
            {%>
                    <option value="<%=sz.getId()%>" <%if(cm.seiza.getId()==sz.getId()){{%>selected<%}}%>>
                            <%=sz.getName()%>
                        </option>
            <%}
                }
            %>
            </select>
            <br>
            出身地
            <%
                List<String> countryList = new ArrayList<String>();
                
                for(Hometown home : list9){
                    
                }
            %>
            <select name="country">
            <%
                for(String ct : countryList){
            {%>
                    <option><%=ct%>></option>
            <%}    
                }
            %>
            </select>
            <select name="province">
                

                    
            </select>
            <br>
            兴趣
            <input type="text" name="hobby" value="<%=cm.getHobby()%>">
            <br>
            CV
            <input type="text" name="cv" value="<%=cm.getCv()%>">
            <br>
            备注
            <input type="text" name="note" value="<%=cm.getNote()%>">
            <br>
            <button type="submit" value="submit"">保存修改</button>
         
        <%
        /*
        request.setCharacterEncoding("UTF-8");
        String nameKanji=request.getParameter("name_Kanji");
        
        if( nameKanji != null){
            String nameKana=request.getParameter("name_Kana");
            String nameRomaji=request.getParameter("name_Romaji");
            int typeId=Integer.parseInt(request.getParameter("type_id")); 
            
            String a=null;
            Date birthday=null;

            System.out.println(cardName);
            System.out.println(charaId);
            System.out.println(rarityId);

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
            e.printStackTrace();
            }
        }
        */
        %>            
            
    </body>
</html>
