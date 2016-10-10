
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%


String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
if(role.equals("Admin")){
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String paramCateTypeId = request.getParameter("cate_type_id");
  String paramCateTypeName = request.getParameter("cate_type_name");
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  com.niems.dwh.connectionJndi jndi = new com.niems.dwh.connectionJndi();
  String  query=""; 
  query+=" UPDATE NIEMS_CATE_TYPE";
  query+=" SET \"cate_type_name\"='"+paramCateTypeName+"',";
  query+=" \"updated_dttm\"="+paramUpdatedDttm+"";
  query+=" WHERE \"cate_type_id\"='"+paramCateTypeId+"'";
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(callback+"("+jndi.getData()+")");
  
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}

/*
http://192.168.1.49:8082/niems/Model/category_type/update.jsp?callback=?
&cate_type_id=1
&cate_type_name=TEST2
*/


%>