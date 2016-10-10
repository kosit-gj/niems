<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
  
  String start_date = request.getParameter("start_date");
  String end_date = request.getParameter("end_date");
  String paramKeyword = request.getParameter("keyword");
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  
  //if(role.equals("Admin")){
	  
	  connectionJndi jndi = new connectionJndi();
  
         
/*
    	  String  query=" "; 
    	  query+="select * FROM NIEMS_LOG ";
    	  query+=" WHERE \"reason\" LIKE '%"+paramKeyword+"%'";
    	  query+=" OR \"log_dttm\" BETWEEN TO_DATE ('"+start_date+"', 'yyyy/mm/dd') AND TO_DATE ('"+end_date+"', 'yyyy/mm/dd');";

		    	  out.print(query);
    	  String columns="1,2,3,4";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
  */        String  query="";
          if(paramKeyword.equals("")){
        	  
        	    query=" select NL.*,NU.\"first_name\",NU.\"last_name\",NU.\"province\" ,NLL.\"link_name\",NCL.\"cate_name\" FROM NIEMS_LOG NL"; 
			  query+=" INNER JOIN NIEMS_USER NU ";
			  query+="ON NL.\"user_name\"=NU.\"user_name\"";
			  query+="INNER JOIN NIEMS_LINK NLL ";
			  query+="ON NL.\"link_id\"=NLL.\"link_id\"";
			  query+="INNER JOIN NIEMS_CATE_LINK NCL";
			  query+=" ON  NLL.\"cate_link_id\"=NCL.\"cate_link_id\"";
			  
			  
	    	  query+=" WHERE \"log_dttm\" BETWEEN TO_DATE ('"+start_date+"', 'yyyy/mm/dd') AND TO_DATE ('"+end_date+"', 'yyyy/mm/dd') ORDER BY NL.\"log_dttm\" DESC";
	    	 // out.print("query1"+query);
          }else{
        	  query=" select NL.*,NU.\"first_name\",NU.\"last_name\",NU.\"province\" ,NLL.\"link_name\",NCL.\"cate_name\" FROM NIEMS_LOG NL"; 
			  query+=" INNER JOIN NIEMS_USER NU ";
			  query+="ON NL.\"user_name\"=NU.\"user_name\"";
			  query+="INNER JOIN NIEMS_LINK NLL ";
			  query+="ON NL.\"link_id\"=NLL.\"link_id\"";
			  query+="INNER JOIN NIEMS_CATE_LINK NCL";
			  query+=" ON  NLL.\"cate_link_id\"=NCL.\"cate_link_id\"";
			  query+=" WHERE \"reason\" LIKE '%"+paramKeyword+"%'";
			  query+="or NU.\"first_name\" LIKE '%"+paramKeyword+"%'  or NU.\"last_name\" LIKE '%"+paramKeyword+"%' ";
			  query+="or NU.\"province\" LIKE '%"+paramKeyword+"%'  or NLL.\"link_name\" LIKE '%"+paramKeyword+"%'  or NCL.\"cate_name\"  LIKE '%"+paramKeyword+"%'" ; 
			  
	    	  query+=" OR \"log_dttm\" BETWEEN TO_DATE ('"+start_date+"', 'yyyy/mm/dd') AND TO_DATE ('"+end_date+"', 'yyyy/mm/dd') ORDER BY NL.\"log_dttm\" DESC";
	    	 // out.print("query2"+query);
          }

    	 
		  //out.print(query);
		  
    	  String columns="1,2,3,4,5,6,7,8,9,10";
          jndi.selectByIndexDwh(query, columns);
          out.println(jndi.getData());
          
          
          
//}else{
	//out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  /*
  http://192.168.1.49:8082/niems/Model/usage_log/search.jsp?callback=?
  &keyword=Test
  &start_date=2559/09/01
  &end_date=2559/09/28
		  
  */
%>