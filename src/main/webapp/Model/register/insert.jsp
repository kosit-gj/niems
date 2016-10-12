<%@include file="../includes/header.jsp" %>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<%@ page import="java.security.*;" %>
<%
//2016-09-12 14:00:20
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
	
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

	String user_name = request.getParameter("user_name");
	String password = request.getParameter("password");
	String passwordMD5="";
	String prefix = request.getParameter("prefix");
	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	String email = request.getParameter("email");
	String province = request.getParameter("province");
	String status = request.getParameter("status");
	String position = request.getParameter("position");
	String organization = request.getParameter("organization");
	String user_items = request.getParameter("user_items");
	String role_id = request.getParameter("role_id");
	String create_dttm = df.format(new java.util.Date());
	
	create_dttm= "(TO_DATE('"+create_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	String updated_dttm = df.format(new java.util.Date());
	updated_dttm = "(TO_DATE('"+updated_dttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
	
	//Manage MD5 START
	MessageDigest alg = MessageDigest.getInstance("MD5");
	alg.reset(); 
	alg.update(password.getBytes());
	byte[] digest = alg.digest();
	
	StringBuffer hashedpasswd = new StringBuffer();
	String hx;
	for (int i=0;i<digest.length;i++){
		hx =  Integer.toHexString(0xFF & digest[i]);
		//0x03 is equal to 0x3, but we need 0x03 for our md5sum
		if(hx.length() == 1){hx = "0" + hx;}
		hashedpasswd.append(hx);
	}
	passwordMD5 = hashedpasswd.toString();
	//Manage MD5 END
	
	//out.println("Date Fotame is= "+update_dttm);

  connectionJndi jndi = new connectionJndi();
  String  query=""; 
 
  query+="INSERT INTO NIEMS_USER";
  query+=" (\"user_name\",\"password\",\"prefix\",\"first_name\",\"last_name\",\"email\",\"province\",\"status\",\"position\",\"organization\",\"user_items\",\"role_id\",\"create_dttm\",\"updated_dttm\")";
  query+=" VALUES('"+user_name+"','"+passwordMD5+"','"+prefix+"','"+first_name+"','"+last_name+"','"+email+"','"+province+"','"+status+"','"+position+"','"+organization+"','"+user_items+"','"+role_id+"',"+create_dttm+","+updated_dttm+")";
		 
 // out.println(passwordMD5);
  jndi.queryDwh(query);
 
  //out.println(jndi.getData());
  //out.println(callback+"("+jndi.getData()+")");
  out.println(jndi.getData());
  
//}else{
  //out.println("Access denied Press contact to administor.");
  //out.println("[\"Access denied Press contact to administor.\"]");
 // out.println(callback+"([\"Access denied Press contact to administor.\"])");
  
//}
  
  

/*
http://192.168.1.49:8082/niems/Model/register/insert.jsp
?callback=?
&user_name=1460600000000
&password=1460600000000
&prefix=Mr.
&first_name=Kosit
&last_name=Aromsava
&email=kosit@gongjesse.com
&province=bangkok
&status=Y
&position=SA
&organization=GJ
&user_items=Y
&role_id=1
*/
 
  
  
%>
