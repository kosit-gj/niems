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
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String cate_link_id = request.getParameter("cate_link_id");
  String cate_name = request.getParameter("cate_name");
  String cate_icon = request.getParameter("cate_icon");
  String ineligible = request.getParameter("ineligible");
  String cate_type_id = request.getParameter("cate_type_id");
  String cate_icon_bg = request.getParameter("cate_icon_bg");
 
  
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  connectionJndi jndi = new connectionJndi();
  
  String  query=""; 
  query+=" UPDATE NIEMS_CATE_LINK";
  query+=" SET \"cate_name\"='"+cate_name+"',";
  query+=" \"cate_icon\"='"+cate_icon+"',";
  query+=" \"cate_icon_bg\"='"+cate_icon_bg+"',";
  query+=" \"ineligible\"='"+ineligible+"',";
  query+=" \"cate_type_id\"='"+cate_type_id+"',";
  query+=" \"updated_dttm\"="+paramUpdatedDttm+"";
  query+=" WHERE \"cate_link_id\"='"+cate_link_id+"'";
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(jndi.getData());
/*
}else{
	out.println(callback+"([\"Access denied Press contact to administor.\"])");
}
*/

/*
http://192.168.1.49:8082/niems/Model/category_link/update.jsp?callback=?
&cate_name=testabcd
&cate_icon=d://dir/image/abc.jpg
&ineligible=Y
&cate_type_id=1
&cate_link_id=1
*/


%>