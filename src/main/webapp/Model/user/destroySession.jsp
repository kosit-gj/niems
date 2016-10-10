<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
 String role = String.valueOf(session.getAttribute("role"));
 String callback = request.getParameter("callback");
// if(role.equals("Admin")){
	 
	session.removeAttribute("user_name");
	session.removeAttribute("prefix");
	session.removeAttribute("first_name");
	session.removeAttribute("last_name");
	session.removeAttribute("email");
	session.removeAttribute("province");
	session.removeAttribute("status");
	session.removeAttribute("position");
	session.removeAttribute("organization");
	session.removeAttribute("user_items");
	session.removeAttribute("role_id");
		
 
  	out.println("[\"success\"]");
 /*
 }else{
	 out.println("[\"Access denied Press contact to administor.\"]");
 }
*/
 //http://192.168.1.49:8082/niems/Model/user/destroySession.jsp?callback=?
 %>