<%@include file="../includes/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  


  
    String callback = request.getParameter("callback");
    String role = String.valueOf(session.getAttribute("role"));
  
//if(role.equals("Admin")){
	  
	 session.removeAttribute("user_name"); 
	 session.removeAttribute("prefix");
	 session.removeAttribute("first_name"); 
	 session.removeAttribute("last_name");
	 session.removeAttribute("email");
	 session.removeAttribute("status"); 
	 session.removeAttribute("position");
	 session.removeAttribute("province");
	 session.removeAttribute("organization");
	 session.removeAttribute("user_items"); 
	 session.removeAttribute("role_id");
	 
	 out.println("[\"success\"]");
	 
	 
  		  
          
          
                    
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/login/logout.jsp?callback=?
%>