<%@include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.security.*" %>
	<%@ page import="com.niems.dwh.*" %>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  //if(role.equals("Admin")){
  	
  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" select U.*,R.\"role_name\" FROM NIEMS_USER U";
    			  query+=" inner join NIEMS_ROLE R ";
    	 		  query+="ON U.\"role_id\" = R.\"role_id\"  ORDER BY U.\"updated_dttm\""; 
		    	 
		  //out.print(query);
    	  String columns="1,3,4,5,6,7,8,9,10,11,12,13,14,15,16";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
         // byte[] md5Data = MessageDigest.getInstance("MD5").digest("010535546".getBytes("UTF-8"));
         
 
         
         
          
 // }else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	 // out.println("[\"Access denied Press contact to administor.\"]");
 // }
          /*### Example Start ###*/
          	//http://192.168.1.49:8082/niems/Model/user/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>