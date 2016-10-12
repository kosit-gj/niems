<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%
 String callback = request.getParameter("callback");
 String param1 = request.getParameter("param1");
 String param2 = request.getParameter("param2");
 param1="session-ok1";
 
 session.setAttribute("authen","success3"); 
 session.setAttribute("param1",param1); 
 session.setAttribute("param2",param2); 

 //param1="[\""+param1+"\"]";
// out.println(callback+"("+param1+")");
 
 
 //http://localhost:8083/niems/view/create_session.jsp?param1=test1&param2=test2
 
 
 %>