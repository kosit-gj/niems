<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
/*
&cate_link_id=1
&link_name=link name1
&link_type=1
&link_url=http://www.google.com
&link_custom=test
*/


String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String link_id = request.getParameter("link_id");
  String link_name = request.getParameter("link_name");
  String link_type = request.getParameter("link_type");
  String link_url = request.getParameter("link_url");
  String link_custom = request.getParameter("link_custom");
  String cate_type_id = request.getParameter("cate_link_id");
 
  
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  connectionJndi jndi = new connectionJndi();
  String  query=""; 
  query+=" UPDATE NIEMS_LINK";
  query+=" SET \"link_name\"='"+link_name+"',";
  query+=" \"link_type\"='"+link_type+"',";
  query+=" \"link_url\"='"+link_url+"',";
  query+=" \"link_custom\"='"+link_custom+"',";
  query+=" \"updated_dttm\"="+paramUpdatedDttm+"";
  query+=" WHERE \"link_id\"='"+link_id+"'";
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(jndi.getData());
  
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}

/*
http://192.168.1.49:8082/niems/Model/link/update.jsp?callback=?
&link_id=2
&cate_link_id=1
&link_name=link name1
&link_type=1
&link_url=http://www.google.com1234
&link_custom=test
*/


%>