<%@include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
<%
//2016-09-12 14:00:20
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	String cate_type_name = request.getParameter("cate_type_name");
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	


	connectionJndi jndi = new connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_CATE_TYPE";
  query+=" (\"cate_type_id\",\"cate_type_name\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_cate_type.nextval,'"+cate_type_name+"',"+create_dttm+","+updated_dttm+")";
		 
  //out.println(query);
  jndi.queryDwh(query);
  //out.println(jndi.getData());
   out.println(jndi.getData());
  
//}else{
  //out.println("Access denied Press contact to administor.");
  //out.println("[\"Access denied Press contact to administor.\"]");
 // out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
//}
  
  

//http://192.168.1.49:8082/niems/Model/category_type/insert.jsp?callback=?&cate_type_name=test
 
  
  
%>
