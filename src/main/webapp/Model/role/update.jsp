<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
///if(role.equals("Admin")){
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String role_id = request.getParameter("role_id");
  String role_name = request.getParameter("role_name");
 
 
  
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  connectionJndi jndi = new connectionJndi();
  String  query=""; 
  query+=" UPDATE NIEMS_ROLE";
  query+=" SET \"role_name\"='"+role_name+"',";
  query+=" \"updated_dttm\"="+paramUpdatedDttm+"";
  query+=" WHERE \"role_id\"='"+role_id+"'";
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(jndi.getData());
  
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}

/*
http://192.168.1.49:8082/niems/Model/role/update.jsp?callback=?
&role_id=2
&role_name=User

*/


%>