
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
	
  String paramCateTypeId = request.getParameter("cate_type_id");
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();

  String  query="DELETE FROM NIEMS_CATE_TYPE WHERE \"cate_type_id\"='"+paramCateTypeId+"'"; 
		    	 
  jndi.queryDwh(query);
  out.println(callback+"("+jndi.getData()+")");
  
}else{
	
	/*out.println("[\"Access denied Press contact to administor.\"]");*/
	
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
	
}
  /*### Example Start ###*/
  	//http://192.168.1.49:8082/niems/Model/category_type/delete.jsp?callback=?&cate_type_id=1
  /*### Example End ###*/
%>