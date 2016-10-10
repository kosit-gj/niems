<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  String paramName = request.getParameter("name");
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" select * FROM TEST WHERE NAME LIKE '%abc%'"; 
		    	 
		    	  //out.print(query);
    	  String columns="1,2";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
  %>