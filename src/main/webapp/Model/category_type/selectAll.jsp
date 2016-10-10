<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="com.niems.dwh.*" %>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  //if(role.equals("Admin")){
  	
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" select * FROM NIEMS_CATE_TYPE order by \"cate_type_name\" asc"; 
		    	 
		  //out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
  //}else{
	     
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
  //}
          /*### Example Start ###*/
          	//http://192.168.1.49:8082/niems/Model/category_type/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>