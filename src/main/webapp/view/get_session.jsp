 <%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String callback = request.getParameter("callback");
String authen = String.valueOf(session.getAttribute("authen"));
String param2 = String.valueOf(session.getAttribute("param2"));


//out.println("param1="+param1);
//out.println("param2="+param2);
 authen="[\""+authen+"\"]";
out.println(callback+"("+authen+")");
%>