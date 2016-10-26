<%@include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
  <%
  
  String paramUserName = request.getParameter("user_name");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
 // if(role.equals("Admin")){
	  
  connectionJndi jndi = new connectionJndi();
  
         
/*
    	  String  query=" "; 
    	  query+="select * FROM NIEMS_USER ";
    	  query+=" WHERE \"user_name\" = '"+paramUserName+"'";
  */  	  
    	  String  query=" select U.*,R.\"role_name\" FROM NIEMS_USER U";
		  query+=" inner join NIEMS_ROLE R ";
 		  query+="ON U.\"role_id\" = R.\"role_id\" "; 
 		 query+=" WHERE \"user_name\" = '"+paramUserName+"'  ORDER BY U.\"updated_dttm\"";
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  /*        
}else{
	out.println("[\"Access denied Press contact to administor.\"]");
}
 */
  //http://192.168.1.49:8082/niems/Model/user/edit.jsp?callback=?&user_name=444
%>