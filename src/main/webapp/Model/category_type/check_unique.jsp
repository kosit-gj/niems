<%@include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
  <%
  
  String cate_type_name = request.getParameter("cate_type_name");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_TYPE ";
    	  query+=" WHERE \"cate_type_name\" = '"+cate_type_name+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
//	out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/category_type/check_unique.jsp?callback=?&cate_type_name=5
%>