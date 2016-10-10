
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
  String paramID = request.getParameter("id");
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();

  String  query="DELETE FROM TEST WHERE ID='"+paramID+"'"; 
		    	 
  jndi.queryDwh(query);
  out.println(jndi.getData());
%>