<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="com.niems.dwh.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.security.*;" %>
  <%
  
  String paramUserName = request.getParameter("user_name");
  String password = request.getParameter("password");
  String passwordMD5 = "";
  String callback = request.getParameter("callback");
  String role = String.valueOf(session.getAttribute("role"));
  
  //if(role.equals("Admin")){
	  
connectionJndi jndi = new connectionJndi();
	
  	
	
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
         

    	  String  query=" "; 
    	  query+="select NU.*,NR.\"role_name\" FROM NIEMS_USER NU ";
    	  query+="INNER JOIN NIEMS_ROLE NR ";
    	  query+="ON NU.\"role_id\"= NR.\"role_id\" ";
    	  query+=" WHERE \"user_name\" = '"+paramUserName+"' and \"password\"='"+passwordMD5+"'";
    	  
    	  
		    	 // out.print(query);
    	  String columns="1,3,4,5,6,7,8,9,10,11,12,13,14,15,16";
          jndi.selectByIndexDwh(query, columns);
         // out.println(callback+"("+jndi.getData()+")");
          
          
         // out.println("RETURN DATA IS ="+jndi.getData());
         Object   dataObject= jndi.getData();
         String  dataString= jndi.getData().toString();
      
        if(dataString.equals("[]")){
        	 //out.println("[\"empty\"]");
        	 //out.println(callback+"([\"empty\"])");
        	 out.println("[\"empty\"]");
        }else{
        	 out.println(dataObject);
        	 session.setAttribute("authen","success"); 
        	 session.setAttribute("authorize","user"); 
	 
        	// session.setAttribute("userName",dataObject); 
        	// session.setAttribute("password",password);
        	// session.setAttribute("role","Admin");
        	
        	
        	 
        }
          
          
          
          
          
	      	
          
///}else{
//	out.println(callback+"([\"Access denied Press contact to administor.\"])");
//}
  /*
  http://192.168.1.49:8082/niems/Model/login/authen.jsp?callback=?
  &user_name=1460600000000
  &password=1460600000000
  */
%>