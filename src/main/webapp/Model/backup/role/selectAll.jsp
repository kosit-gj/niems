<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  if(role.equals("Admin")){
  	
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" select * FROM NIEMS_ROLE"; 
		    	 
		    	  //out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
  }else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	out.println(callback+"([\"Access denied Press contact to administor.\"])");
  }
          /*### Example Start ###*/
          //http://192.168.1.49:8082/niems/Model/role/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>