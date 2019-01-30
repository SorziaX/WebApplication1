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
               <nav class="content-menu">
                <ul>
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a href="cardinstock.jsp">持有卡片一览</a>
                    </li>
                    <li class="current">
                        <a href="charalist.jsp">CGSS角色一览</a>
                    </li>
                    <li>
                        <a href="cardlist.jsp">CGSS卡牌一览</a>
                    </li>
                </ul>
            </nav>
            
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
                        <p id="editChara"></p>
                    </div>
                    <div class="profile-left-2">
                        <ul>
                            <p id="height"></p>
                            <p id="age"></p>
                            <p id="weight"></p>
                            <p id="birthday"></p>
                            <p id="hometown"></p>
                            <p id="hobby"></p>
                            <p id="cv"></p>
                            <p id="note"></p>
                        </ul>
                    </div>
                </div>
                <div class="profile-right">
                    <div class="profile-right-1" id="card_list">
                    </div>
                </div>
            

            <script>
                    
                <%
                    String idString = request.getParameter("id");
                    if(idString != null){
                        out.print("display(" + idString + ")");
                    }
                %>
                
                function display(charaId)
                {
                    var htmlobj=$.ajax({url:"charalist_process.jsp?id=" + charaId,async:false});
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
                    document.getElementById("editChara").innerHTML = "<a href=\"charaedit.jsp?id="+ obj.chara.id +"\">修改角色信息</a>"
                    
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
                        div.id = "card";
                        
                        var div01 = document.createElement("div");
                        div01.id="cardImage";
                        div01.style = "background-image:url(image/card/card_"+ obj.cardList[i].cardId + "_icon.jpg);"
                        div.appendChild(div01);
                        
                        var div02 = document.createElement("div");
                        div02.id="cardDetail";
                        div.appendChild(div02);
                        
                        var div03 = document.createElement("div");
                        div03.id="cardInfo1";
                        div02.appendChild(div03);
                        
                        var div04 = document.createElement("div");
                        div04.id="cardInfo2";
                        div02.appendChild(div04);
                        
                        var div11 = document.createElement("div");
                        div11.id = "cardName";
                        
                        var div12 = document.createElement("div");
                        /*id = cardRarity-[N,R,SR,SSR]*/
                            
                        var div13 = document.createElement("div");
                        div13.id = "cardAmount";
                        
                        
                        div11.innerHTML = "<a href=\"cardpage.jsp?id="+obj.cardList[i].cardId + "\">" + obj.cardList[i].cardName + "</a>";
                        div03.appendChild(div11);
                        
                        if (obj.cardList[i].rarityName == "SSR") {
                            div12.id = "cardRarity-SSR";
                            div12.innerHTML = obj.cardList[i].rarityName;
                            div04.appendChild(div12);
                        } else if  (obj.cardList[i].rarityName == "SR") {
                            div12.id = "cardRarity-SR";
                            div12.innerHTML = obj.cardList[i].rarityName;
                            div04.appendChild(div12);
                        }  else if  (obj.cardList[i].rarityName == "R") {
                            div12.id = "cardRarity-R";
                            div12.innerHTML = obj.cardList[i].rarityName;
                            div04.appendChild(div12);
                        } else {
                            div12.id = "cardRarity-N";
                            div12.innerHTML = obj.cardList[i].rarityName;
                            div04.appendChild(div12);
                        }
                        div13.innerHTML ="持有"+obj.cardList[i].cardAmount + "张";
                        div04.appendChild(div13);
                        
                        document.getElementById("card_list").appendChild(div);
 
                    }
                        
                }
                
                
                    
            </script>

        </div>
    </body>
</html>
