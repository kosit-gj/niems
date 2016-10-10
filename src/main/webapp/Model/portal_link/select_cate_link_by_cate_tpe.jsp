<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String cate_type_id = request.getParameter("cate_type_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
connectionJndi jndi = new connectionJndi();
  
         
			String  query=" select ncl.*,NCT.\"cate_type_name\" FROM NIEMS_CATE_LINK ncl";
			query+=" INNER JOIN NIEMS_CATE_TYPE nct ON NCL.\"cate_type_id\" = NCT.\"cate_type_id\"";
			query+=" WHERE NCL.\"cate_type_id\" = '"+cate_type_id+"'";
			query+=" ORDER BY NCL.\"cate_name\""; 
			/*
    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_LINK ";
    	  query+=" WHERE \"cate_type_id\" = '"+cate_type_id+"'";
			*/
		    	  //out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/portal_link/select_cate_link_by_cate_tpe.jsp?callback=?&cate_type_id=1
%>