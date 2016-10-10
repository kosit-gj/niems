<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String role_id = request.getParameter("role_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  if(role.equals("Admin")){
	  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_ROLE ";
    	  query+=" WHERE \"role_id\" = '"+role_id+"'";
    	  
    	  
		  // out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}
  //http://192.168.1.49:8082/niems/Model/role/edit.jsp?callback=?&role_id=2
%>