<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//2016-09-12 14:00:20
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	
	String cate_link_id = request.getParameter("cate_link_id");
	String link_name = request.getParameter("link_name");
	String link_type = request.getParameter("link_type");
	String link_url = request.getParameter("link_url");
	String link_custom = request.getParameter("link_custom");

	
	
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	


	connectionJndi jndi = new connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_LINK";
  query+=" (\"link_id\",\"cate_link_id\",\"link_name\",\"link_type\",\"link_url\",\"link_custom\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_link.nextval,'"+cate_link_id+"','"+link_name+"','"+link_type+"','"+link_url+"','"+link_custom+"',"+create_dttm+","+updated_dttm+")";
		 
  //out.println(query);
  jndi.queryDwh(query);
  //out.println(jndi.getData());
  out.println(jndi.getData());
  
//}else{

  //out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
//}
  
  

/*
http://192.168.1.49:8082/niems/Model/link/insert.jsp?callback=?
&cate_link_id=1
&link_name=link name1
&link_type=1
&link_url=http://www.google.com
&link_custom=test
*/
 
  
  
%>
