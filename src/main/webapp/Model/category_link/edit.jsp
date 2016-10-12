<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String paramCateTypeId = request.getParameter("cate_link_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
 // if(role.equals("Admin")){
	  
  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_LINK ";
    	  query+=" WHERE \"cate_link_id\" = '"+paramCateTypeId+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4,5,8";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/category_link/edit.jsp?callback=?&cate_link_id=5
%>