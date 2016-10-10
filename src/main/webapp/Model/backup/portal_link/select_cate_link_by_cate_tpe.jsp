<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String cate_type_id = request.getParameter("cate_type_id");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  if(role.equals("Admin")){
	  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_CATE_LINK ";
    	  query+=" WHERE \"cate_type_id\" = '"+cate_type_id+"'";

		    	  //out.print(query);
    	  String columns="1,2,3,4,5,6,7";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}
  //http://192.168.1.49:8082/niems/Model/portal_link/select_cate_link_by_cate_tpe.jsp?callback=?&cate_type_id=1
%>