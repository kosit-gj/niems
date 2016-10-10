<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String start_date = request.getParameter("start_date");
  String end_date = request.getParameter("end_date");
  String paramKeyword = request.getParameter("keyword");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  
  if(role.equals("Admin")){
	  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  
         

    	  String  query=" "; 
    	  query+="select * FROM NIEMS_LOG ";
    	  query+=" WHERE \"reason\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"log_dttm\" BETWEEN TO_DATE ('"+start_date+"', 'yyyy/mm/dd') AND TO_DATE ('"+end_date+"', 'yyyy/mm/dd');";

		    	  out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(callback+"("+jndi.getData()+")");
          
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}
  /*
  http://192.168.1.49:8082/niems/Model/usage_log/search.jsp?callback=?
  &keyword=Test
  &start_date=2016/09/01
  &end_date=2016/09/28
		  
  */
%>