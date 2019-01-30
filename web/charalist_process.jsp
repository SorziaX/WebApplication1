<%-- 
    Document   : process
    Created on : 2019/01/17, 15:27:37
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.text.SimpleDateFormat" %> 
<%@ page import="org.json.*" %> 
<%@ page import="cgsslog.DAO.*, cgsslog.*"%>

<%  
    int charaId = Integer.parseInt(request.getParameter("id"));  
    /*显示角色信息*/
    CharaMasterDAO dao = new CharaMasterDAO();
    
    CharaMaster cm = dao.selectChara(charaId);
    
    Date birthday = cm.getBirthday();
    SimpleDateFormat sdf = new SimpleDateFormat("MM月dd日");
    String NewDate = sdf.format(birthday);
    
    JSONObject obj = new JSONObject();
    
    obj.put("id",cm.getId());
    obj.put("nameKanji", cm.getNameKanji());
    obj.put("nameKana", cm.getNameKana());
    obj.put("nameRomaji", cm.getNameRomaji());
    obj.put("type", cm.type.getName());
    obj.put("height", cm.getHeight());
    obj.put("age", cm.getAge());
    obj.put("weight", cm.getWeight());
    obj.put("birthday", NewDate);
    obj.put("seiza", cm.seiza.getName());
    obj.put("country", cm.hometown.getCountry());
    obj.put("province", cm.hometown.getProvince());
    obj.put("hobby", cm.getHobby());
    obj.put("cv", cm.getCv());
    obj.put("note", cm.getNote());
    
    JSONObject obj2 = new JSONObject();
    obj2.put("chara",obj);
    
    
    /*显示角色卡片*/
    CardMasterDAO dao2 = new CardMasterDAO();
    CardInStockDAO dao3 = new CardInStockDAO();
    
    List<CardMaster> list = dao2.readCharaCard(charaId);
    int cardAmount;
    JSONArray list2 = new JSONArray();
    int i = 0;
    
    for(CardMaster cdm:list){
        JSONObject obj3 = new JSONObject();
        int cardId = cdm.getId();
        cardAmount = dao3.countCard(cardId);
        obj3.put("cardId", cardId);
        obj3.put("cardName", cdm.getCardName());
        obj3.put("rarityName",cdm.rarity.getName());
        obj3.put("cardAmount",cardAmount);
        list2.put(obj3);
        i++;
    }
    
    obj2.put("cardList",list2);
    
    out.print(obj2.toString());

%>
