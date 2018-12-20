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
            request.setCharacterEncoding("UTF-8");
            
            int charaId = Integer.parseInt(request.getParameter("id"));  
            CharaMasterDAO dao = new CharaMasterDAO();
            CharaMaster cm = dao.selectChara(charaId);
            
            TypeDAO dao7 = new TypeDAO();
            List<Type> list7 = dao7.readType();
            
            SeizaDAO dao8 = new SeizaDAO();
            List<Seiza> list8 = dao8.readSeiza();
            
            HometownDAO dao9 = new HometownDAO();
            List<Hometown> list9 = dao9.readHome();

            if(request.getParameter("update")!=null){
                System.out.println("修改后数据");
                System.out.println("name_kanji  : " + request.getParameter("name_Kanji"));
                System.out.println("name_Kana   : " + request.getParameter("name_Kana"));
                System.out.println("name_Romaji : " + request.getParameter("name_Romaji"));
                System.out.println("type_id     : " + request.getParameter("type_id"));
                System.out.println("height      : " + request.getParameter("height"));
                System.out.println("age         : " + request.getParameter("age"));
                System.out.println("birthday    : " + request.getParameter("birthday"));
                System.out.println("seiza_id    : " + request.getParameter("seiza_id"));
                System.out.println("home_id     : " + request.getParameter("home_id"));
                System.out.println("hobby       : " + request.getParameter("hobby"));
                System.out.println("cv          : " + request.getParameter("cv"));
                System.out.println("note        : " + request.getParameter("note"));
                

                System.out.println("数据更新判断");
                
                String sNameKanji=request.getParameter("name_Kanji");
                System.out.println("input name_kanji : " + sNameKanji);
                System.out.println("name_Kanji in DB : "+cm.getNameKanji());
                String nameKanji=null;
                if(!(sNameKanji== null)&& !(sNameKanji.equals(""))
                    && !(sNameKanji == cm.getNameKanji())){
                    nameKanji=sNameKanji;
                }else{
                    nameKanji=cm.getNameKanji();
                }
                System.out.println("name_kanji for update: " + nameKanji);
                
                
                String sNameKana=request.getParameter("name_Kana");
                System.out.println("input name_kana : " + sNameKana);
                System.out.println("name_Kana in DB : "+cm.getNameKana());
                String nameKana=null;
                if(!(sNameKana==null)&& !(sNameKana.equals(""))
                    &&!(sNameKana== cm.getNameKana())){
                    nameKana=sNameKana;
                }else{
                    nameKana=cm.getNameKana();
                }
                System.out.println("name_kana for update: " + nameKana);
                
                
                String sNameRomaji = request.getParameter("name_Romaji");
                System.out.println("input name_Romaji : " + sNameRomaji);
                System.out.println("name_Romaji in DB : "+cm.getNameRomaji());
                String nameRomaji=null;
                if(!(sNameRomaji==null) && !(sNameRomaji.equals(""))
                    &&!(sNameRomaji== cm.getNameRomaji()))
                {
                    nameRomaji=sNameRomaji;
                }else{
                    nameRomaji=cm.getNameRomaji();
                }
                System.out.println("name_Romaji for update: " + nameRomaji);
                

                String sTypeId = request.getParameter("type_id");
                System.out.println("input type_id : " + sTypeId);
                System.out.println("type_id in DB : "+cm.type.getId());
                int typeId = 0;
                if(!(sTypeId == null) &&!(Integer.parseInt(sTypeId)==cm.type.getId()))
                {
                        typeId = Integer.parseInt(sTypeId);
                }else{
                        typeId = cm.type.getId();
                }
                System.out.println("type_id for update: " + typeId);

                
                String sHeight = request.getParameter("height");
                System.out.println("input height = "+ sHeight);
                System.out.println("height in DB = " + cm.getHeight());
                int height = 0;
                if(!(sHeight == null) &&!(sHeight.equals(""))
                    &&!(Integer.parseInt(sHeight)==cm.getHeight()))
                {
                        height = Integer.parseInt(sHeight);
                }else{
                        height = cm.getHeight();
                }
                System.out.println("height for update: " + height);
                
                
                String sAge = request.getParameter("age");
                System.out.println("input age = "+ sAge);
                System.out.println("age in DB = " + cm.getAge());
                int age = 0;
                if(!(sAge == null) && !(sAge.equals(""))
                        &&!(Integer.parseInt(sAge)==cm.getAge()))
                {
                        age = Integer.parseInt(sAge);
                }else{
                        age = cm.getAge();
                }
                System.out.println("age for update: " + age);
                
                String sWeight = request.getParameter("weight");
                System.out.println("input weight = " + sWeight);
                System.out.println("weight in DB = " + cm.getWeight());
                int weight = 0;
                if(!(sWeight == null) && !(sWeight.equals(""))
                        && !(Integer.parseInt(sWeight)==cm.getWeight()))
                {
                        weight = Integer.parseInt(sWeight);
                }else{
                        weight = cm.getWeight();
                }
                System.out.println("weight for update: " + weight);
                
                /*
                SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
                Date birth= sdf2.parse(request.getParameter("birthday"));
                System.out.println("Editing: "+birth);
                java.sql.Date sBirthday = new java.sql.Date(birth.getTime());
                */

                Date uDate = new Date();
                java.sql.Date sBirthday = new java.sql.Date(uDate.getTime());
                
                
                String sSeizaId = request.getParameter("seiza_id");
                System.out.println("input seiza_id = " + sSeizaId);
                System.out.println("seiza_id in db = " + cm.seiza.getId());
                int seizaId = 0;
                if(!(sSeizaId == null) && !(sSeizaId.equals(""))
                        && !(Integer.parseInt(sSeizaId)==cm.seiza.getId()))
                {
                        seizaId = Integer.parseInt(sSeizaId);
                }else{
                        seizaId = cm.seiza.getId();
                }
                System.out.println("seiza_id for update: " + seizaId);
                
                
                String sHomeId = request.getParameter("home_id");
                System.out.println("input home_id = " + sHomeId);
                System.out.println("homd_id in db = " + cm.hometown.getId());
                int homeId = 0;
                if(!(sHomeId == null) && !(sHomeId.equals(""))
                        && !(Integer.parseInt(sHomeId)==cm.hometown.getId()))
                {
                        homeId = Integer.parseInt(sHomeId);
                }else{
                        homeId = cm.hometown.getId();
                }
                System.out.println("home_id for update: " + homeId);
                
                String sHobby = request.getParameter("hobby");
                System.out.println("input hobby = " + sHobby);
                System.out.println("hobby in db = " + cm.getHobby());
                String hobby=null;
                if(!(sHobby==null) && !(sHobby.equals("")) && !(sHobby==cm.getHobby())){
                    hobby=sHobby;
                }else{
                    hobby=cm.getHobby();
                }
                System.out.println("hobby for update: " + hobby);
                
                String sCv = request.getParameter("cv");
                System.out.println("input cv = " + sCv);
                System.out.println("cv in DB = " + cm.getCv());
                String cv = null;
                if(!(sCv == null) &&!(sCv.equals("")) &&!(sCv==cm.getCv())){
                    cv=sCv;
                }else{
                    cv=cm.getCv();
                }
                System.out.println("cv for update: " + cv);
                
                String sNote = request.getParameter("note");
                System.out.println("input note = " + sNote);
                System.out.println("note in DB = " + cm.getNote());
                String note = null;
                if(!(sNote==null) && !(sNote.equals("")) &&!(sNote==cm.getNote())){
                    note = sNote;
                }else{
                    note=cm.getNote();
                }
                System.out.println("note for update: " + note);

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
                
                System.out.println("Start updating");
                cmDao.editChara(chara);

                }
                catch(Exception e)
                {
                e.printStackTrace();
                }
            }
        
        %>      
        
            <form method="post" action="charaedit.jsp?id=<%=cm.getId()%>" accept-charset="UTF-8">
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
                <td><input type="text" name="name_Kanji"></td>
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
                        <option value="<%=tp.getId()%>"><%=tp.getName()%></option>
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
                <td>年龄</td>
                <td><%=cm.getAge()%></td>
                <td><input type="text" name="age"></td>
            </tr>
            <tr>
                <td>体重</td>
                <td><%=cm.getWeight()%>kg</td>
                <td><input type="text" name="weight">kg</td>
            </tr>
            <tr>
                <td>生日</td>
                <td><%=cm.getBirthday()%></td>
                <td><input type="text" name="birthday"></td>
            </tr>
            <tr>
                <td>星座</td>
                <td><%=cm.seiza.getName()%></td>
                <td><select name="seiza_id">
                <% 
                    for(Seiza sz : list8){
                {%>
                        <option value="<%=sz.getId()%>"><%=sz.getName()%></option>
                <%}
                    }
                %>
                </select></td>
            </tr>
            <tr>
                <td>出身地</td>
                <td><%=cm.hometown.getCountry()%> <%=cm.hometown.getProvince()%></td>
                <td><select name="home_id">
                <%
                    for(Hometown home : list9){
                {%>
                <option value="<%=home.getId()%>"><%=home.getCountry()%> <%=home.getProvince()%></option>
                <%}
                    }
                %>
                </select></td>
            </tr>
            <tr>
                <td>兴趣</td>
                <td><%=cm.getHobby()%></td>
                <td><input type="text" name="hobby"></td>
            </tr>
            <tr>
                <td>CV</td>
                <td><%=cm.getCv()%></td>
                <td><input type="text" name="cv"></td>
            </tr>
            <tr>
                <td>备注</td>
                <td><%=cm.getNote()%></td>
                <td><input type="text" name="note"></td>
                
            </tr>
            </table>
            <input type="hidden" name="update" value="updateFLag">
            <button type="submit" value="submit">保存修改</button>
        </form> 
                
      
            
    </body>
</html>
