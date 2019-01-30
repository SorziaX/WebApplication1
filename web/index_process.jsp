<%-- 
    Document   : index_process
    Created on : 2019/01/29, 11:48:15
    Author     : shenhanfei
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.text.DecimalFormat" %> 
<%@ page import="org.json.*" %> 
<%@ page import="cgsslog.DAO.*, cgsslog.*"%>

<%  
    /*显示角色信息*/
    CardInStockDAO dao1 = new CardInStockDAO();
    CardMasterDAO dao2 = new CardMasterDAO();
    
    
    int cisAmount = dao1.countCIS();
    int cisDistinctAmount = dao1.countDistinctCIS();
    int cardAmount = dao2.countCard();
    float cardPercent = (cisDistinctAmount * 100.0f) / cardAmount;
    
    JSONObject obj = new JSONObject();
    
    obj.put("cisAmount",cisAmount);
    obj.put("cisDistinctAmount",cisDistinctAmount);
    obj.put("cardAmount",cardAmount);
    obj.put("cardPercent",cardPercent);
    
    out.print(obj.toString());

%>
