
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
	
  String role_map_link_id = request.getParameter("role_map_link_id");
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();

  String  query="DELETE FROM NIEMS_ROLE_MAP_LINK WHERE \"role_map_link_id\"='"+role_map_link_id+"'"; 
		    	 
  jndi.queryDwh(query);
  out.println(callback+"("+jndi.getData()+")");
  
}else{
	
	/*out.println("[\"Access denied Press contact to administor.\"]");*/
	
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
	
}
  /*### Example Start ###*/
  	//http://192.168.1.49:8082/niems/Model/role_map_link/delete.jsp?callback=?&role_map_link_id=1
  /*### Example End ###*/
%>