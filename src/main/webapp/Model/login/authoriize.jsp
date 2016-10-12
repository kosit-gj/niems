<%@include file="../includes/header.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
    String user_name = request.getParameter("user_name");
	String prefix = request.getParameter("prefix");
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String email = request.getParameter("email");
	String province = request.getParameter("province");
	String status = request.getParameter("status");
	String position = request.getParameter("position");
	String organization = request.getParameter("organization");
	String user_items = request.getParameter("user_items");
	String role_id = request.getParameter("role_id");
  
    String callback = request.getParameter("callback");
    
    if(role_id.equals("1")){
    	session.setAttribute("role","Admin");
    }
    String role = String.valueOf(session.getAttribute("role"));
    String authen = String.valueOf(session.getAttribute("authen"));
    
  
//if(role.equals("Admin")){
	  
	
	
	
	if(authen==null){
		 out.println("[\"notSuccess\"]");
	}else{
		
		 session.setAttribute("user_name",user_name); 
		 session.setAttribute("prefix",prefix);
		 session.setAttribute("first_name",first_name); 
		 session.setAttribute("last_name",last_name);
		 session.setAttribute("email",email);
		 session.setAttribute("status",status); 
		 session.setAttribute("position",position);
		 session.setAttribute("province",province);
		 session.setAttribute("organization",organization);
		 session.setAttribute("user_items",user_items); 
		 session.setAttribute("role_id",role_id);
		 
		 
		 

		 //out.println("user_name"+session.getAttribute("user_name"));
		 //out.println("first_name"+session.getAttribute("first_name"));
		 out.println("[\"success\"]");
	
	
	}
	
	 
  		  
          
          
                    
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
/*  
http://192.168.1.49:8082/niems/Model/login/authoriize.jsp?
callback=?
&user_name=1460600000000
&prefix=Mr.
&first_name=Kosit
&last_name=Aromsava
&email=kosit@goingjesse.com
&status=Y
&position=SA
&province=Bangkok
&organization=GJ
&user_items=Y
&role_id=1

*/
%>