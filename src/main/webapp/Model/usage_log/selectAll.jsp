<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String role = String.valueOf(session.getAttribute("role"));
  String callback = request.getParameter("callback");
  //if(role.equals("Admin")){
  	
	  connectionJndi jndi = new connectionJndi();
  
         

    	  String  query=" select NL.*,NU.\"first_name\",NU.\"last_name\",NU.\"province\" ,NLL.\"link_name\",NCL.\"cate_name\" FROM NIEMS_LOG NL"; 
    			  query+=" INNER JOIN NIEMS_USER NU ";
    			  query+="ON NL.\"user_name\"=NU.\"user_name\"";
    			  query+="INNER JOIN NIEMS_LINK NLL ";
    			  query+="ON NL.\"link_id\"=NLL.\"link_id\"";
    			  query+="INNER JOIN NIEMS_CATE_LINK NCL";
    			  query+=" ON  NLL.\"cate_link_id\"=NCL.\"cate_link_id\" ORDER BY NL.\"log_dttm\" DESC";
		    	 
		  //out.print(query);
    	  String columns="1,2,3,4,5,6,7,8,9,10";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
  //}else{
	  
	  	//out.println("[\"Access denied Press contact to administor.\"]");
	  	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
  //}
          /*### Example Start ###*/
          	//http://192.168.1.49:8082/niems/Model/usage_log/selectAll.jsp?callback=?
          /*### Example Start ###*/
  %>