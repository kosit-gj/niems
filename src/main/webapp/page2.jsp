 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <%
 /*
http://192.168.1.49:8082/niems/Model/login/authoriize.jsp?
callback=?
&user_name=1460600053789
&prefix=Mr.
&first_name=Kosit
&last_name=Aromsava
&email=kosit@goingjesse.com
&status=Y
&position=SA
&province=Bangkok
&organization=GJ
&role_id=1
&user_items=Y
 */
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

 out.println("user_name="+user_name);
 out.println("prefix="+prefix); 
 out.println("first_name="+first_name);
 out.println("last_name="+last_name);
 out.println("email="+email);
 out.println("status="+status);
 out.println("position="+position);
 out.println("province="+province);
 out.println("organization="+organization);
 out.println("role_id="+role_id);
 out.println("user_items="+user_items);


 
 %>
 
 
