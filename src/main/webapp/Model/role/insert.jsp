<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
//2016-09-12 14:00:20

/*
Table role

role_id
role_name
create_dttm
updated_dttm
*/
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	
	String role_name = request.getParameter("role_name");

	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	


	connectionJndi jndi = new connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_ROLE";
  query+=" (\"role_id\",\"role_name\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_role.nextval,'"+role_name+"',"+create_dttm+","+updated_dttm+")";
		 
 
  jndi.queryDwh(query);
 // out.println(query);
  out.println(jndi.getData());
  //out.println(callback+"("+jndi.getData()+")");
  
//}else{

  //out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
//}
  
  

/*
http://192.168.1.49:8082/niems/Model/role/insert.jsp?callback=?
&role_name=amin
*/
 
  
  
%>
