<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  //if(role.equals("Admin")){
  	
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" select NL.*,NCL.\"cate_name\",NCT.\"cate_type_name\" FROM NIEMS_LINK NL"; 
    			  query+=" INNER JOIN NIEMS_CATE_LINK NCL";
    			  query+=" ON NL.\"cate_link_id\"=NCL.\"cate_link_id\"";
    			  query+=" INNER JOIN NIEMS_CATE_TYPE NCT";
    			  query+=" ON NCL.\"cate_type_id\" = NCT.\"cate_type_id\""; 
    			  query+=" ORDER BY NCT.\"cate_type_name\",NCL.\"cate_name\",NL.\"link_name\""; 
		    	 
		    	  //out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9,10";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
  //}else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
  //}
          /*### Example Start ###*/
          //http://192.168.1.49:8082/niems/Model/link/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>