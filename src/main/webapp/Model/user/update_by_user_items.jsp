<%@include file="../includes/header.jsp" %>
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
  String paramPassword = request.getParameter("password");
  String passwordMD5="";
  String paramPrefix = request.getParameter("prefix");
  String paramFirstName = request.getParameter("first_name");
  String paramLastName = request.getParameter("last_name");
  String paramEmail = request.getParameter("email");
  String paramTel = request.getParameter("tel");
  String paramProvince = request.getParameter("province");
  String paramStatus = request.getParameter("status");
  String paramPosition = request.getParameter("position");
  String paramOraganization = request.getParameter("organization");
  String paramUserItems = request.getParameter("user_items");
  String paramRoleId = request.getParameter("role_id");
  String paramResetPass = request.getParameter("resetPass");
  String paramUpdatedDttm = df.format(new java.util.Date());
  paramUpdatedDttm = "(TO_DATE('"+paramUpdatedDttm+"', 'yyyy/mm/dd hh24:mi:ss'))";
  
  
//Manage MD5 START
	MessageDigest alg = MessageDigest.getInstance("MD5");
	alg.reset(); 
	alg.update(paramPassword.getBytes());
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
	Integer count=1;
  
	  query+=" UPDATE NIEMS_USER";
	  query+=" SET";
	  
 if(!paramPrefix.equals("")){
 
  if(count==1){
  	query+="  \"prefix\"='"+paramPrefix+"'";
  }else{
	query+="  ,\"prefix\"='"+paramPrefix+"'";  
  }
  count+=1;
 }
 
 if(!paramFirstName.equals("")){
  
  if(count==1){
	  query+="  \"first_name\"='"+paramFirstName+"'";
  }else{
	  query+=" , \"first_name\"='"+paramFirstName+"'"; 
  }
  count+=1;
 }
	  
if(!paramLastName.equals("")){
		  
		  if(count==1){
			  query+="  \"last_name\"='"+paramLastName+"'";
		  }else{
			  query+=" , \"last_name\"='"+paramLastName+"'";
		  }
		  count+=1;
	  }


if(!paramEmail.equals("")){
	  
	  if(count==1){
		  query+="  \"email\"='"+paramEmail+"'";
	  }else{
		  query+=" , \"email\"='"+paramEmail+"'";
	  }
	  count+=1;
}

if(!paramTel.equals("")){
	  
	  if(count==1){
		  query+="  \"tel\"='"+paramTel+"'";
	  }else{
		  query+=" , \"tel\"='"+paramTel+"'";
	  }
	  count+=1;
}

if(!paramProvince.equals("")){
	  
	  if(count==1){
		  query+="  \"province\"='"+paramProvince+"'";
	  }else{
		  query+=" , \"province\"='"+paramProvince+"'";
	  }
	  count+=1;
}


if(!paramPosition.equals("")){
	  
	  if(count==1){
		  query+="  \"position\"='"+paramPosition+"'";
	  }else{
		  query+=" , \"position\"='"+paramPosition+"'";
	  }
	  count+=1;
}

if(!paramOraganization.equals("")){
	  
	  if(count==1){
		  query+="  \"organization\"='"+paramOraganization+"'";
	  }else{
		  query+=" , \"organization\"='"+paramOraganization+"'";
	  }
	  count+=1;
}

if(!paramUpdatedDttm.equals("")){
	  
	  if(count==1){
		  query+="  \"updated_dttm\"="+paramUpdatedDttm+"";
	  }else{
		  query+=" , \"updated_dttm\"="+paramUpdatedDttm+"";
	  }
	  count+=1;
}
	  
	  //query+="  \"prefix\"='"+paramPrefix+"'";
	  //query+=" , \"first_name\"='"+paramFirstName+"'";
	  //query+=" , \"last_name\"='"+paramLastName+"'";
	  //query+=" , \"email\"='"+paramEmail+"'";
	  //query+=" , \"tel\"='"+paramTel+"'";
	  //query+=" , \"province\"='"+paramProvince+"'";
	  //query+=" , \"position\"='"+paramPosition+"'";
	  //query+=" , \"organization\"='"+paramOraganization+"'";
	  //query+=" , \"updated_dttm\"="+paramUpdatedDttm+"";

	  query+=" WHERE \"user_name\"='"+paramUserName+"'";
  
 
		    	 
  jndi.queryDwh(query);
  //out.println(query);
  out.println(jndi.getData());
  
  
  if(jndi.getData().equals("['success']")){
	  
		
	  session.setAttribute("user_name",paramUserName); 
	  session.setAttribute("first_name",paramFirstName); 
	  session.setAttribute("last_name",paramLastName); 
	  session.setAttribute("email",paramEmail); 
	  session.setAttribute("province",paramProvince); 
	  session.setAttribute("status",paramStatus); 
	  session.setAttribute("position",paramPosition); 
	  session.setAttribute("organization",paramOraganization); 
	  session.setAttribute("user_items",paramUserItems); 
	  session.setAttribute("role_id",paramRoleId); 
	  
  }
  
 /* 
}else{
	out.println("[\"Access denied Press contact to administor.\"]");
}
*/
/*
http://localhost:8083/niems/Model/user/update_by_user_items.jsp?user_name=1460600053789&&password=1234&prefix=%E0%B8%99%E0%B8%B2%E0%B8%87&first_name=%E0%B9%82%E0%B8%86%E0%B8%A9%E0%B8%B4%E0%B8%95&last_name=%E0%B8%AD%E0%B8%B2%E0%B8%A3%E0%B8%A1%E0%B8%93%E0%B9%8C%E0%B8%AA%E0%B8%A7%E0%B8%B0&email=kosit2@gmail.com&province=bangkok&status=true&position=SAA&organization=GJ&user_items=1&role_id=1&update_dttm=2016-09-12%2014:00:20&tel=010535546
*/


%>