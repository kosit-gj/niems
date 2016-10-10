<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
 String user = request.getParameter("user");
 String password = request.getParameter("password");
 
 
 if(user.equals("admin") && password.equals("password")){
	 session.setAttribute("user",user); 
	 session.setAttribute("password",password);
	 session.setAttribute("role","Admin");
	 
	 
	 String user2 = String.valueOf(session.getAttribute("user"));
	 String password2 = String.valueOf(session.getAttribute("password"));
	 /*
	 out.println("user2="+user2);
	 out.println("password2="+password2);
	 */
	 out.println("[\"success\"]");
 }else{
	 out.println("[\"notSuccess\"]");
 }
 
 %>