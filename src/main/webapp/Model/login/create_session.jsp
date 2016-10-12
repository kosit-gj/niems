<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
 <%
 String callback = request.getParameter("callback");
 String secretKey = request.getParameter("secretKey");


 if(secretKey.equals("9987")){
 session.setAttribute("authen","success"); 
 String data="[\"success\"]";
 out.println(callback+"("+data+")");
 }else{
 String data="[\"failed\"]";
 out.println(callback+"("+data+")");
 session.setAttribute("authen","failed"); 	 
 }
 //session.setAttribute("param1",param1); 
 //session.setAttribute("param2",param2); 

// param1="[\""+param1+"\"]";
 //out.println(callback+"("+param1+")");
 
 
 //http://localhost:8083/niems/view/create_session.jsp?param1=test1&param2=test2
 
 
 %>