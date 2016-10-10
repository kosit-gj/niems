
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  String paramID = request.getParameter("id");
  String paramName = request.getParameter("name");
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
  query+=" UPDATE TEST";
  query+=" SET NAME='"+paramName+"'";
  query+=" WHERE ID='"+paramID+"'";
		    	 
  jndi.queryDwh(query);
  out.println(jndi.getData());
%>