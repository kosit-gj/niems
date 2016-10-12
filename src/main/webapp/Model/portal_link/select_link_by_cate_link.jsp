<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role_id = request.getParameter("role_id");
  String cate_link_id = request.getParameter("cate_link_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
	  connectionJndi jndi = new connectionJndi();
  
         
/*
    	  String  query=" "; 
    	  query+="select * FROM NIEMS_LINK ";
    	  query+=" WHERE \"cate_link_id\" = '"+cate_link_id+"'";

    	  */
    	  /*
    	  String  query=" select NL.*,NCL.\"cate_name\"  FROM NIEMS_LINK NL"; 
		  query+=" INNER JOIN NIEMS_CATE_LINK NCL";
		  query+=" ON NL.\"cate_link_id\"=NCL.\"cate_link_id\""; 
		  query+=" WHERE NL.\"cate_link_id\" = '"+cate_link_id+"'";
		  */
		 
		  String  query=" select NL.*,NCL.\"cate_name\",NCT.\"cate_type_name\" FROM NIEMS_LINK NL"; 
		  query+=" INNER JOIN NIEMS_CATE_LINK NCL";
		  query+=" ON NL.\"cate_link_id\"=NCL.\"cate_link_id\"";
		  query+=" INNER JOIN NIEMS_CATE_TYPE NCT";
		  query+=" ON NCL.\"cate_type_id\" = NCT.\"cate_type_id\""; 
		  query+=" WHERE NL.\"cate_link_id\" = '"+cate_link_id+"'";
		  query+=" ORDER BY NCT.\"cate_type_name\",NCL.\"cate_name\",NL.\"link_name\""; 
		  
		  
		    	 // out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9,10";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
	
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.48:8082/niems/Model/portal_link/select_link_by_cate_link.jsp?callback=?&cate_link_id=92&role_id=All
%>