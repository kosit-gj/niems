<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
<%
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
  String paramID = request.getParameter("user_name");
  
  if(paramID.equals("")){
  out.println("[\"Error\"]");
  }else{
  connectionJndi jndi = new connectionJndi();

  String  query="DELETE FROM NIEMS_USER WHERE \"user_name\"='"+paramID+"'"; 
		    	 
  jndi.queryDwh(query);
  
  out.println(jndi.getData());
  }
  /*
}else{
	
	out.println("[\"Access denied Press contact to administor.\"]");
	
	
	
}
*/
  /*### Example Start ###*/
  	//http://192.168.1.49:8082/niems/Model/user/delete.jsp?user_name=1234567891234
  /*### Example End ###*/
%>