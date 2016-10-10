<%
    response.addHeader("Access-Control-Allow-Origin", "*");
    response.addHeader("Access-Control-Allow-Credentials", "true");
%>
<%@ page import="java.util.Properties" %>               
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
  <%
		/*
		final String auth_host = "mail.thaicreate.com";
		final String auth_port = "25";
		final String auth_email = "no-reply@thaicreate.com";
		final String auth_password = "password";
		*/
		 String user_name = request.getParameter("user_name");
		 String password = request.getParameter("password");
		 String email = request.getParameter("email");
		 String emailType = request.getParameter("emailType");
		if(email.equals("") &&  user_name.equals("") &&  password.equals("")){
			
			out.println("[\"Error\"]");

		}else{
		/*	
		final String auth_host = "mail1.miems.go.th";
		final String auth_port = "25";
		final String auth_email = "anurut.s@niems.go.th";
		final String auth_password = "Anurut53011";
		*/
		final String auth_host = "smtp.gmail.com";
		final String auth_port = "465";
		final String auth_email = "kosit@goingjesse.com";
		final String auth_password = "nong010535546";
		
		Properties props = new Properties();
		props.put("mail.smtp.host", auth_host);
		props.put("mail.smtp.socketFactory.port", auth_port);
		props.put("mail.smtp.socketFactory.class",
		               "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", auth_port);


          try {

        	  Session mailSession = Session.getInstance(props,
                      new javax.mail.Authenticator() {
                          protected PasswordAuthentication 
                                getPasswordAuthentication() {
                              return new PasswordAuthentication
                                (auth_email,auth_password);
                          }
                      });
        	  
        	  Message message = new MimeMessage(mailSession);
        	  
              message.setFrom(new InternetAddress(auth_email)); // From
              
              /*** Recipient ***/
              message.setRecipients(Message.RecipientType.TO,
                      InternetAddress.parse(""+email+"")); // To
              if(emailType.equals("changePass")){
            	  message.setSubject("ได้ทำการเปลี่ยนรหัสบัญชีเข้าใช้งานระบบคลังข้อมูลการแพทย์ฉุกเฉิน(Data Warehouse)เรียบร้อยแล้ว");  
              }else{
              	  message.setSubject("ได้ทำการสร้างบัญชีเข้าใช้งานระบบคลังข้อมูลการแพทย์ฉุกเฉิน(Data Warehouse)เรียบร้อยแล้ว");
              }
              message.setText("\nUsername : "+user_name+", Password : "+password+"");

              Transport.send(message);

              out.println("[\"success\"]");

          } catch (MessagingException e) {
              throw new RuntimeException(e);
          }
		}
	//http://localhost:8082/niems/Model/user/sendEmail.jsp?user_name=abcd&password=1234&email=nn.it@hotmail.com
  %>

