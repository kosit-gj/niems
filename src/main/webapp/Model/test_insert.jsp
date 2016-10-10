
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query="INSERT INTO TEST (ID,NAME) VALUES ('7','ABCDEF')"; 
		    	 
  jndi.queryDwh(query);
  out.println(jndi.getData());
%>