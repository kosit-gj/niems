<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
 session.removeAttribute("user");  
 session.removeAttribute("password");
 session.removeAttribute("role");
 out.println("[\"success\"]");
 
 %>