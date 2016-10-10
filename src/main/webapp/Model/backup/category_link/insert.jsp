
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//2016-09-12 14:00:20
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	String cate_name = request.getParameter("cate_name");
	String cate_icon = request.getParameter("cate_icon");
	String ineligible = request.getParameter("ineligible");
	String cate_type_id = request.getParameter("cate_type_id");
	
	
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	


  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_CATE_LINK";
  query+=" (\"cate_link_id\",\"cate_name\",\"cate_icon\",\"ineligible\",\"cate_type_id\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES(seq_cate_link.nextval,'"+cate_name+"','"+cate_icon+"','"+ineligible+"','"+cate_type_id+"',"+create_dttm+","+updated_dttm+")";
		 
  //out.println(query);
  jndi.queryDwh(query);
  //out.println(jndi.getData());
  out.println(callback+"("+jndi.getData()+")");
  
}else{
  //out.println("Access denied Press contact to administor.");
  //out.println("[\"Access denied Press contact to administor.\"]");
  out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
}
  
  

/*
http://192.168.1.49:8082/niems/Model/category_link/insert.jsp?callback=?
&cate_name=test
&cate_icon=d://dir/image/abc.jpg
&ineligible=Y
&cate_type_id=1
*/
 
  
  
%>
