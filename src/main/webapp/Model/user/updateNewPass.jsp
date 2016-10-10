<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.security.*" %>
	<%@ page import="com.niems.dwh.*" %>
<%

/*
user_name
password
prefix
first_name
last_name
email
province
status
position
organization
user_items
role_id
create_dttm
updated_dttm
*/
String role = String.valueOf(session.getAttribute("role"));
String callback = request.getParameter("callback");
//if(role.equals("Admin")){
  java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

  String paramUserName = request.getParameter("user_name");
  String paramNewPassword = request.getParameter("newPassword");
  String passwordMD5="";
  
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  
//Manage MD5 START
if(paramUserName.equals("")){
	
}else{
	MessageDigest alg = MessageDigest.getInstance("MD5");
	alg.reset(); 
	alg.update(paramNewPassword.getBytes());
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
  
  connectionJndi jndi = new connectionJndi();
  
  String  query=""; 
 
	  query+=" UPDATE NIEMS_USER";
	  query+=" SET \"password\"='"+passwordMD5+"'";
	  query+=" , \"updated_dttm\"="+paramUpdatedDttm+"";
	  query+=" WHERE \"user_name\"='"+paramUserName+"'";
 
 
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(jndi.getData());
  
}
//http://localhost:8083/niems/Model/user/updateNewPass.jsp?user_name=1460600053789&newPassword=22222

%>