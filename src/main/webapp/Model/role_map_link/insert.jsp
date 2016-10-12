<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//2016-09-12 14:00:20

/*
Table role_map_link

role_map_link_id
role_id
link_id
create_dttm
updated_dttm


*/
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	
	String role_id = request.getParameter("role_id");
	String link_id = request.getParameter("link_id");
	String create_dttm = df.format(new java.util.Date());
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	

	String[] link_id_array = link_id.split(",");
	
	
	connectionJndi jndi = new connectionJndi();
  	String  query=""; 
	String  queryDel=""; 
  	queryDel+=" DELETE FROM NIEMS_ROLE_MAP_LINK WHERE \"role_id\"='"+role_id+"'";
  	jndi.queryDwh(queryDel);
  	//out.println(jndi.getData());
   
    query+="INSERT ALL ";
  	for(int i = 0; i < link_id_array.length; i+=1) { 
        



	query+="INTO NIEMS_ROLE_MAP_LINK (\"role_id\",\"link_id\",\"create_dttm\",\"updated_dttm\") ";
	query+=" VALUES  ('"+role_id+"','"+link_id_array[i]+"',";
	query+=" "+create_dttm+",";
	query+=" "+updated_dttm+")";
	
  		
		/*
  		if(i==1){
  		query+=" INSERT INTO NIEMS_ROLE_MAP_LINK";
  	  	query+=" (\"role_map_link_id\",\"role_id\",\"link_id\",\"create_dttm\",\"updated_dttm\")";
  	  	query+=" VALUES(seq_role_map_link.nextval,'"+role_id+"','"+link_id_array[i]+"',"+create_dttm+","+updated_dttm+")";
  		}
		*/
  	} 
  	query+="SELECT * FROM dual  ";
 
  	
		 
  	//out.println(query);
  	jndi.queryDwh(query);
    out.println(jndi.getData());
  
//}else{

  //out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
//}
  
  

/*
http://192.168.1.49:8082/niems/Model/role_map_link/insert.jsp?callback=?
&role_id=2
&link_id=1,2,3,4,5
*/
 
  
  
%>
