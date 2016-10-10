<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  String role_id = request.getParameter("role_id");
  if(role.equals("Admin")){
  	
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" select * FROM NIEMS_ROLE_MAP_LINK WHERE \"role_id\"='"+role_id+"'"; 
		    	 
		    	  out.print(query);
    	  String columns="1,2,3,4,5";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
  }else{
	    
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	out.println(callback+"([\"Access denied Press contact to administor.\"])");
  }
          /*### Example Start ###*/
          /*
          http://192.168.1.49:8082/niems/Model/role_map_link/selectLinkByRoleId.jsp?callback=?
        	&role_id=2
          */
          /*### Example Start ###*/
  %>