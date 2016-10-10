
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String role_map_link_id = request.getParameter("role_map_link_id");
  String role_id = request.getParameter("role_id");
  String link_id = request.getParameter("link_id");
 
 
  
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
  query+=" UPDATE NIEMS_ROLE_MAP_LINK";
  query+=" SET \"role_id\"='"+role_id+"',";
  query+="     \"link_id\"='"+link_id+"',";
  query+="     \"updated_dttm\"="+paramUpdatedDttm+"";
  query+=" WHERE \"role_map_link_id\"='"+role_map_link_id+"'";
		    	 
  jndi.queryDwh(query);
  out.println(query);
  out.println(callback+"("+jndi.getData()+")");
  
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}

/*
http://192.168.1.49:8082/niems/Model/role_map_link/update.jsp?callback=?
&role_map_link_id=3
&role_id=1
&link_id=1

*/


%>