<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.security.*;" %>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  if(role.equals("Admin")){
  	
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" select * from NIEMS_PROVINCE ORDER BY \"province_name\" ";
    			 
		    	 
		  //out.print(query);
    	  String columns="1,2";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
         // byte[] md5Data = MessageDigest.getInstance("MD5").digest("010535546".getBytes("UTF-8"));
         
 
         
         
          
  }else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	out.println(callback+"([\"Access denied Press contact to administor.\"])");
  }
          /*### Example Start ###*/
          	//http://192.168.1.49:8082/niems/Model/user/select_province.jsp?callback=?
          /*### Example Start ###*/
  %>