<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String paramCateTypeId = request.getParameter("cate_type_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  if(role.equals("Admin")){
	  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_TYPE ";
    	  query+=" WHERE \"cate_type_id\" = '"+paramCateTypeId+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}
  //http://192.168.1.49:8082/niems/Model/category_type/edit.jsp?callback=?&cate_type_id=5
%>