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
//if(role.equals("Admin")){
	
  String paramCateLinkId = request.getParameter("cate_link_id");
  
  connectionJndi jndi = new connectionJndi();

  String  query="DELETE FROM NIEMS_CATE_LINK WHERE \"cate_link_id\"='"+paramCateLinkId+"'"; 
		    	 
  jndi.queryDwh(query);
  out.println(jndi.getData());
  
//}else{
	
	/*out.println("[\"Access denied Press contact to administor.\"]");*/
	
	//out.println("[\"Access denied Press contact to administor.\"");
	
//}
  /*### Example Start ###*/
  	//http://192.168.1.49:8082/niems/Model/category_link/delete.jsp?callback=?&cate_type_id=1
  /*### Example End ###*/
%>