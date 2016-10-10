
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//2016-09-12 14:00:20

/*
Table role_map_link

role_map_link_id
role_id
link_id
create_dttm
updated_dttm


*/
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	
	String role_id = request.getParameter("role_id");
	String link_id = request.getParameter("link_id");
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	


  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_ROLE_MAP_LINK";
  query+=" (\"role_map_link_id\",\"role_id\",\"link_id\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_role_map_link.nextval,'"+role_id+"','"+link_id+"',"+create_dttm+","+updated_dttm+")";
		 
  out.println(query);
  jndi.queryDwh(query);
  //out.println(jndi.getData());
  out.println(callback+"("+jndi.getData()+")");
  
}else{

  out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
}
  
  

/*
http://192.168.1.49:8082/niems/Model/role_map_link/insert.jsp?callback=?
&role_id=2
&link_id=1
*/
 
  
  
%>
