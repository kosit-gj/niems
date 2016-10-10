<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
  <%
  
  String paramCateTypeId = request.getParameter("cate_type_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_TYPE ";
    	  query+=" WHERE \"cate_type_id\" = '"+paramCateTypeId+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
//}else{
//	out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  //http://192.168.1.49:8082/niems/Model/category_type/edit.jsp?callback=?&cate_type_id=5
%>