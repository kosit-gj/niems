 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%

 String user_name = String.valueOf(session.getAttribute("user_name"));
 String prefix = String.valueOf(session.getAttribute("prefix")); 
 String first_name = String.valueOf(session.getAttribute("first_name"));
 String last_name = String.valueOf(session.getAttribute("last_name"));
 String email = String.valueOf(session.getAttribute("email"));
 String status = String.valueOf(session.getAttribute("status"));
 String position = String.valueOf(session.getAttribute("position"));
 String province = String.valueOf(session.getAttribute("province"));
 String organization = String.valueOf(session.getAttribute("organization"));
 String role_id = String.valueOf(session.getAttribute("role_id"));
 String user_items = String.valueOf(session.getAttribute("user_items"));

 String role = String.valueOf(session.getAttribute("role"));
 String callback = request.getParameter("callback");
 if(role.equals("Admin")){
 String jsonFotmat="{";
 	jsonFotmat+="\"user_name\":\""+user_name+"\",\"prefix\":\""+prefix+"\",";
 	jsonFotmat+="\"first_name\":\""+first_name+"\",\"last_name\":\""+last_name+"\",";
 	jsonFotmat+="\"email\":\""+email+"\",\"status\":\""+status+"\",";
 	jsonFotmat+="\"position\":\""+position+"\",\"organization\":\""+organization+"\",";
 	jsonFotmat+="\"role_id\":\""+role_id+"\",\"user_items\":\""+user_items+"\",";
 	jsonFotmat+="\"province\":\""+province+"\"";
 jsonFotmat+="}";


 out.println(callback+"("+jsonFotmat+")");
 }else{
	 out.println(callback+"([\"Access denied Press contact to administor.\"])");
 }
 //http://192.168.1.49:8082/niems/Model/user/session.jsp
 
 %>
 
 
