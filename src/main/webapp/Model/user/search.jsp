<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
  <%
  
  String paramKeyword = request.getParameter("keyword");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
 connectionJndi jndi = new connectionJndi();
  
         

		 String  query=" select U.*,R.\"role_name\" FROM NIEMS_USER U";
		 query+=" inner join NIEMS_ROLE R ";
		 query+=" ON U.\"role_id\" = R.\"role_id\" "; 
  
    	  query+=" WHERE \"first_name\" LIKE '%"+paramKeyword+"%'";
    	  
    	  
    	  query+=" OR \"last_name\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"email\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"province\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"position\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"organization\" LIKE '%"+paramKeyword+"%'";
    	  query+=" ORDER BY U.\"updated_dttm\"";
    	  
		    	 // out.print(query);
    	  String columns="1,3,4,5,6,7,8,9,10,11,12,13,14,15,16";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  /*        
}else{
	out.println("[\"Access denied Press contact to administor.\"]");
}
  */
  //http://192.168.1.49:8082/niems/Model/user/search.jsp?callback=?&keyword=bangkok
%>