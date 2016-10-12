<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String role_map_link_id = request.getParameter("role_map_link_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_ROLE_MAP_LINK ";
    	  query+=" WHERE \"role_map_link_id\" = '"+role_map_link_id+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4,5";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/role_map_link/edit.jsp?callback=?&role_map_link_id=2
%>