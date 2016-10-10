<%@ page import="java.util.Properties" %>               
<%@ page import="javax.mail.Message" %>
<%@ page import="javax.mail.MessagingException" %>
<%@ page import="javax.mail.PasswordAuthentication" %>
<%@ page import="javax.mail.Session" %>
<%@ page import="javax.mail.Transport" %>
<%@ page import="javax.mail.internet.InternetAddress" %>
<%@ page import="javax.mail.internet.MimeMessage" %>

<html>
<head>
	<title>goingjesse.com</title>
</head>
<body>
<%
		/*
		final String auth_host = "mail.thaicreate.com";
		final String auth_port = "25";
		final String auth_email = "no-reply@thaicreate.com";
		final String auth_password = "password";
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
                      InternetAddress.parse("nn.it@hotmail.com")); // To
              message.setSubject("Test sending mail from JSP");
              message.setText("Hello mr.win, Please do not reply this mail");

              Transport.send(message);

              out.println("Mail Send Successfully.");

          } catch (MessagingException e) {
              throw new RuntimeException(e);
          }
  %>
</body>
</html>
