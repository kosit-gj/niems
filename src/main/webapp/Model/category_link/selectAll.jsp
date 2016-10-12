
<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  //if(role.equals("Admin")){
  	
	  connectionJndi jndi = new connectionJndi();
         

    	  String  query=" select ncl.*,NCT.\"cate_type_name\" FROM NIEMS_CATE_LINK ncl";
    			  query+=" INNER JOIN NIEMS_CATE_TYPE nct ON NCL.\"cate_type_id\" = NCT.\"cate_type_id\"";
    			  query+=" ORDER BY NCL.\"cate_name\""; 
		    	 
		    	  //out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  /*       
  }else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	out.println(callback+"([\"Access denied Press contact to administor.\"])");
  }
  */
          /*### Example Start ###*/
          	//http://192.168.1.49:8082/niems/Model/category_link/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>