 <%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%
 String param1 = request.getParameter("param1");
 String param2 = request.getParameter("param2");
 session.setAttribute("param1",param1); 
 session.setAttribute("param2",param2); 
 
 //http://localhost:8083/niems/view/create_session.jsp?param1=test1&param2=test2
 
 
 %>