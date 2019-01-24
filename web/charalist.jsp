<%-- 
    Document   : newjsp
    Created on : 2018/11/05, 20:39:25
    Author     : shenhanfei
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="org.json.*" %> 
<%@ page import="cgsslog.*,cgsslog.DAO.*" %> 
<script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CGSS TAKE MY MONEY</title>   
        <link rel="stylesheet" href="css/charalist.css">
    </head>
    <body>
        <div class="content">
            <div class="content-menu">
                <a href="index.html">返回</a>
            </div>
            
            <div class="chara-list">
                
                    <%
                        CharaMasterDAO dao = new CharaMasterDAO();
                        List<CharaMaster> list = dao.readChara();
                        int charaId = 0;
                        for(CharaMaster cm:list){
                            charaId = cm.getId();
                            {%>
                                <div onclick="display(<%=charaId %>)">
                                    <div id="chara-list1"><%=charaId %></div>
                            <%}
                                if(cm.type.getId()==1){
                                    {%>  <div id="chara-list2-cute"><%=cm.getNameKanji() %></div>   <%}
                                }else if(cm.type.getId()==2){
                                    {%> <div id="chara-list2-cool"><%=cm.getNameKanji() %></div>    <%}
                                }else{
                                    {%> <div id="chara-list2-passion"><%=cm.getNameKanji() %></div> <%}
                                }
                            {%></div><%}}
                     %>
            </div>
            
            <div class="chara-page">
                
                <div class="profile-left">
                    <div class="profile-left-1" id="chara-image">
                        <p id="nameKana"></p>
                        <p id="nameKanji"></p>
                        <p id="nameRomaji"></p>
                            <p id="type-cute"></p>
                            <p id="type-cool"></p>
                            <p id="type-passion"></p>
                    </div>
                    <div class="profile-left-2">
                        <ul>
                            <li4><p id="height"></p></li4>
                            <li4><p id="age"></p></li4>
                            <li4><p id="weight"></p></li4>
                            <li4><p id="birthday"></p></li4>    
                            <li4><p id="hometown"></p></li4>
                            <li4><p id="hobby"></p></li4>
                            <li4><p id="cv"></p></li4>
                            <li4><p id="note"></p></li4>
                        </ul>
                    </div>
                </div>
                <div class="profile-right">
                    <div class="profile-right-1" id="card_list">
                    </div>
                </div>
            

            <script>
                function display(charaId)
                {
                    var htmlobj=$.ajax({url:"charapage_process.jsp?id=" + charaId,async:false});
                    var jsonString = htmlobj.responseText;
                    
                    var obj = JSON.parse(jsonString)
                    document.getElementById("nameKanji").innerHTML  =   obj.chara.nameKanji;
                    document.getElementById("nameKana").innerHTML   =   obj.chara.nameKana;
                    document.getElementById("nameRomaji").innerHTML =   obj.chara.nameRomaji;
                    if (obj.chara.type == "CUTE" ) {
                        document.getElementById("type-cute").style.display = "block";
                        document.getElementById("type-cute").innerHTML =   obj.chara.type;
                        document.getElementById("type-cool").style.display = "none";
                        document.getElementById("type-passion").style.display = "none";
                    } else if (obj.chara.type == "COOL") {
                        document.getElementById("type-cute").style.display = "none";
                        document.getElementById("type-cool").style.display = "block";
                        document.getElementById("type-cool").innerHTML =  obj.chara.type;
                        document.getElementById("type-passion").style.display = "none";
                    } else if (obj.chara.type == "PASSION"){
                        document.getElementById("type-cute").style.display = "none";
                        document.getElementById("type-cool").style.display = "none";
                        document.getElementById("type-passion").style.display = "block";
                        document.getElementById("type-passion").innerHTML =  obj.chara.type;
                    } else {
                        document.getElementById("type-cute").style.display = "none";
                        document.getElementById("type-cool").style.display = "none";
                        document.getElementById("type-passion").style.display = "none";
                    }
                    document.getElementById("height").innerHTML =   "身高：" + obj.chara.height + "cm";
                    document.getElementById("age").innerHTML =   "年龄：" + obj.chara.age;
                    document.getElementById("weight").innerHTML =   "体重：" + obj.chara.weight + "kg";
                    document.getElementById("birthday").innerHTML =   "生日：" + obj.chara.birthday;
                    document.getElementById("hometown").innerHTML =   "出生地：" + obj.chara.country + " " + obj.chara.province;
                    document.getElementById("hobby").innerHTML =   "兴趣：" + obj.chara.hobby;
                    document.getElementById("cv").innerHTML =   "CV：" + obj.chara.cv;
                    document.getElementById("note").innerHTML =   "NOTE：" + obj.chara.note;
                    
                    document.getElementById("chara-image").style = "background-image:url(image/chara/chara_"+obj.chara.id+".png);";
                    
                    document.getElementById("card_list").innerHTML="";
                    for(var i in obj.cardList){
                        var div = document.createElement("div");
                        div.innerHTML = 
                            obj.cardList[i].cardName + "<br>" +
                            obj.cardList[i].rarityName + " " +
                            "持有"+obj.cardList[i].cardAmount + "张"
                        ;
                        document.getElementById("card_list").appendChild(div);
                    }
                        
                }
                    
            </script>

        </div>
    </body>
</html>
