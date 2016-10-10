
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//2016-09-12 14:00:20

/*
Table Log
 log_id
 reason
 link_id
 user_name
 create_dttm
 updated_dttm

*/
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	String reason = request.getParameter("reason");
	String link_id = request.getParameter("link_id");
	String user_name = request.getParameter("user_name");
	
	
	
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	
	
	//out.println("Date Fotame is= "+update_dttm);

  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_LOG";
  query+=" (\"log_id\",\"reason\",\"link_id\",\"user_name\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_log.nextval,'"+reason+"','"+link_id+"','"+user_name+"',"+create_dttm+","+updated_dttm+")";
		 
  out.println(query);
  jndi.queryDwh(query);
  //out.println(jndi.getData());
  out.println(callback+"("+jndi.getData()+")");
  
}else{
  //out.println("Access denied Press contact to administor.");
  //out.println("[\"Access denied Press contact to administor.\"]");
  out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
}
  
  
/*
http://192.168.1.49:8082/niems/Model/usage_log/insert.jsp?callback=?
&reason=reson becuace data is...
&link_id=1
&user_name=1234567891234

*/
 
  
  
%>
