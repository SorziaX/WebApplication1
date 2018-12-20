<%-- 
    Document   : cardedit
    Created on : 2018/12/14, 11:04:11
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>  
<%@ page import="java.lang.Iterable" %> 
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %> 
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
            <table>
            <tr>
                <th></th>
                <th>修改前</th>
                <th>修改后</th>
            </tr>
            <tr>
                <td>姓名（汉字）</td>
                <td><%=cm.getNameKanji()%></td>
                <td><input type="text" name="name_Kanji" ></td>
            </tr>
            <tr>
                <td>姓名（假名）</td>
                <td><%=cm.getNameKana()%></td>
                <td><input type="text" name="name_Kana" ></td>
            </tr>
            <tr>
                <td>姓名（罗马音）</td>
                <td><%=cm.getNameRomaji()%></td>
                <td><input type="text" name="name_Romaji"></td>
            </tr>
            <tr>
                <td>属性</td>
                <td><%=cm.type.getName()%>
                <td><select name="type_id">
                    <% 
                    for(Type tp : list7){
                        {%>
                        <option value="<%=tp.getId()%>" <%if(cm.type.getId()==tp.getId()){{%>selected<%}}%>>
                                <%=tp.getName()%>
                            </option>
                        <%}
                    }
                    %>
                </select></td>
            </tr>
            <tr>
                <td>身高</td>
                <td><%=cm.getHeight()%>cm</td>
                <td><input type="text" name="height">cm</td>
            </tr>
            <tr>
                <td>年龄
                <input type="text" name="age" value="<%=cm.getAge()%>">
            </tr>
                体重
                <input type="text" name="weight" value="<%=cm.getWeight()%>">kg
                <br>
                生日
                <input type="text" name="birthday" value="<%=cm.getBirthday()%>">
                </input>
                <br>
                星座
                <select name="seiza_id">
                <%
                System.out.println("get Seiza list");
                %>
                <% 
                    for(Seiza sz : list8){
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
                <select name="home_id">
                <%
                System.out.println("get hometown list");
                    for(Hometown home : list9){
                {%>
                <option value="<%=home.getId()%>>" <%if(cm.hometown.getId()==home.getId()){{%>selected<%}}%>>
                    <%=home.getCountry()%> <%=home.getProvince()%>
                </option>
                <%}
                    }
                %>
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
            </tr>
            </table>
            <br>
            <button type="submit" value="submit">保存修改</button>
        </form> 
        <%
            request.setCharacterEncoding("UTF-8");
 
                System.out.println("Start updating");
                
                String nameKanji=null;
                if(!(request.getParameter("name_Kanji")== null)
                    && !(request.getParameter("name_Kanji")== cm.getNameKanji())){
                    nameKanji=request.getParameter("name_Kanji");
                }else{
                    nameKanji=cm.getNameKanji();
                }
                
                String nameKana=null;
                if(!(request.getParameter("name_Kana")==null)
                    &&!(request.getParameter("name_Kana")== cm.getNameKana())){
                    nameKana=request.getParameter("name_Kana");
                }else{
                    nameKana=cm.getNameKana();
                }
                
                String nameRomaji=null;
                if(!(request.getParameter("name_Romaji")==null)
                    &&!(request.getParameter("name_Romaji")== cm.getNameRomaji())){
                    nameRomaji=request.getParameter("name_Romaji");
                }else{
                    nameRomaji=cm.getNameRomaji();
                }
                
                int typeId = 0;
                System.out.println("input typeId = "+ request.getParameter("type_id"));
                System.out.println("type_id in DB = " + cm.type.getId());
                if(!(request.getParameter("type_id") == null)
                    &&!(Integer.valueOf(request.getParameter("type_id")).intValue()==cm.type.getId())){
                        typeId = Integer.parseInt(request.getParameter("typid"));
                }else{
                        typeId = cm.type.getId();
                }
                
                int height = 0;
                System.out.println("input height = "+ request.getParameter("height"));
                System.out.println("height in DB = " + cm.type.getId());
                if(!(request.getParameter("height") == null)
                    &&!(Integer.valueOf(request.getParameter("height")).intValue()==cm.getHeight())){
                        height = Integer.valueOf(request.getParameter("height")).intValue();
                }else{
                        height = cm.getHeight();
                }
                
                
                int age = 0;
                if(!(request.getParameter("age") == null)
                    &&!(Integer.valueOf(request.getParameter("age")).intValue()==cm.getAge())){
                        age = Integer.parseInt(request.getParameter("age"));
                }else{
                        age = cm.getAge();
                }
                
                int weight = 0;
                if(!(request.getParameter("weight") == null)){
                    int left4 = Integer.parseInt(request.getParameter("weight"));
                    if(left4 != cm.getWeight()){
                        weight = left4;
                    }else{
                        weight = cm.getWeight();
                    }
                }
                
                /*
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                Date birth= sdf2.parse(request.getParameter("birthday"));
                System.out.println("Editing: "+birth);
                java.sql.Date sBirthday = new java.sql.Date(birth.getTime());
                */

                Date uDate = new Date();
                java.sql.Date sBirthday = new java.sql.Date(uDate.getTime());
                
                int seizaId = 0;
                if(!(request.getParameter("seiza_id") == null)){
                    int left5 = Integer.parseInt(request.getParameter("seiza_id"));
                    if(left5 != cm.seiza.getId()){
                        seizaId = left5;
                    }else{
                        seizaId = cm.seiza.getId();
                    }
                }
                
                int homeId = 0;
                if(!(request.getParameter("home_id") == null)){
                    int left6 = Integer.parseInt(request.getParameter("seiza_id"));
                    if(left6 != cm.hometown.getId()){
                        homeId = left6;
                    }else{
                        homeId = cm.hometown.getId();
                    }
                    
                }
                
                String hobby=null;
                if(!(request.getParameter("hobby")==null)
                        &&!(request.getParameter("hobby")==cm.getHobby())){
                    hobby=request.getParameter("hobby");
                }else{
                    hobby=cm.getHobby();
                }
                
                String cv = null;
                if(!(request.getParameter("cv")==null)
                        &&!(request.getParameter("cv")==cm.getCv())){
                    cv=request.getParameter("cv");
                }else{
                    cv=cm.getCv();
                }
                
                String note = null;
                if(!(request.getParameter("note")==null)
                        &&!(request.getParameter("note")==cm.getNote())){
                    note=request.getParameter("note");
                }else{
                    note=cm.getNote();
                }

                String a=null;

                try
                {
                Type type = new Type(typeId,a);
                Seiza seiza = new Seiza(seizaId,a);
                Hometown home = new Hometown(homeId,a,a);
                CharaMaster chara = new CharaMaster(charaId, nameKanji, nameKana,
                                        nameRomaji, type, height, age, weight,
                                        sBirthday, seiza, home, hobby, cv, note);
                CharaMasterDAO cmDao = new CharaMasterDAO();

                cmDao.editChara(chara);

                }
                catch(Exception e)
                {
                e.printStackTrace();
                }
            
        
        %>            
            
    </body>
</html>
