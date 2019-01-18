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

                <ul class="thead">
                        <li1>ID</li1>
                        <li2>名前</li2>
                        <li3>属性</li3>
                        <li3>显示详情</li3>
                </ul>
                
                    <%
                        CharaMasterDAO dao = new CharaMasterDAO();
                        List<CharaMaster> list = dao.readChara();
                        int charaId = 0;
                        for(CharaMaster cm:list){
                            charaId = cm.getId();
                            {%>
                                <ul>
                                <li1><%=charaId %></li1>
                                <li2><%=cm.getNameKanji() %></li2>
                                <li3><%=cm.type.getName() %></li3>
                                <li3><button onclick="display(<%=charaId %>)">显示</button></li3>
                                </ul>
                            <%}
                        }
                     %>    
            </div>
            
            <div class="chara-page">
                <div class="profile-1">
                    <div class="profile-1-left">
                        profile-1-left
                        <ul>
                            <li4><p id="profile"></p></li4>
                            <li4><p id="nameKanji"></p></li4>
                            <li4><p id="nameKana"></p></li4>
                            <li4><p id="nameRomaji"></p></li4>
                            <li4><p id="type"></p></li4>
                        </ul>
                    </div>
                    <div class="profile-1-right">
                        profile-1-right
                    </div>
                </div>
                <div class="profile-2">
                    <div class="profile-2-left">
                        profile-2-left
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
                    <div class="profile-2-right">
                        profile-2-right
                        <ul class="thead">
                            <li2>卡片名</li2>
                            <li3>稀有度</li3>
                            <li1>持有数</li1>
                            <li3>获取卡片</li3>
                        </ul>
                        <ul>
                            <li2><p id="cardName"></p></li2>
                            <li3><p id="rarityName"></p></li3>
                            <li1><p id="cardAmount"></p></li1>
                            <!--
                            <li3>
                                <form method="post" action="addcardinstock.jsp?id=<p id="cardId"></p>" accept-charset="UTF-8">
                                    <button type="submit" value="submit"">添加</button>
                                </form>
                            </li3>
                            --!>
                        </ul>
                    </div>
                </div>
            </div>
            

            <script>
                function display(charaId)
                {
                    var htmlobj=$.ajax({url:"charapage_process.jsp?id=" + charaId,async:false});
                    var jsonString = htmlobj.responseText;
                    
                    var obj = JSON.parse(jsonString)
                    document.getElementById("profile").innerHTML  =   "Profile";
                    document.getElementById("nameKanji").innerHTML  =   "姓名：" + obj.chara.nameKanji;
                    document.getElementById("nameKana").innerHTML   =   "假名：" + obj.chara.nameKana;
                    document.getElementById("nameRomaji").innerHTML =   "罗马音：" + obj.chara.nameRomaji;
                    document.getElementById("type").innerHTML =   "属性：" + obj.chara.type;
                    document.getElementById("height").innerHTML =   "身高：" + obj.chara.height + "cm";
                    document.getElementById("age").innerHTML =   "年龄：" + obj.chara.age;
                    document.getElementById("weight").innerHTML =   "体重：" + obj.chara.weight + "kg";
                    document.getElementById("birthday").innerHTML =   "生日：" + obj.chara.birthday;
                    document.getElementById("hometown").innerHTML =   "出生地：" + obj.chara.country + " " + obj.province;
                    document.getElementById("hobby").innerHTML =   "兴趣：" + obj.chara.hobby;
                    document.getElementById("cv").innerHTML =   "CV：" + obj.chara.cv;
                    document.getElementById("note").innerHTML =   "NOTE：" + obj.chara.note;
                    
                    
                    for (var i=0;i<obj.charalist.length;i++)
                    {
                        var div = document.createElement("div");
                        div.innerHTML = obj.charalist[i].cardId;
                        document.getElementById("cardId").appendChild(div);
                        div.innerHTML = obj.charalist[i].cardName;
                        document.getElementById("cardName").appendChild(div);
                        div.innerHTML = obj.charalist[i].rarityName;
                        document.getElementById("rarityName").appendChild(div);
                        div.innerHTML = obj.charalist[i].cardAmount;
                        document.getElementById("cardAmount").appendChild(div);
                    }
                    
                }
            </script>

        </div>
    </body>
</html>
