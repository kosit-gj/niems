  package com.niems.dwh;

    import java.util.Properties;  
    import javax.mail.*;  
    import javax.mail.internet.*;  
      
    public class SendMailSSL {  
     public static void main(String[] args) {  
      
     String to="nn.it@hotmail.com";//change accordingly  
      
      //Get the session object  
     /*
      final String auth_host = "mail1.niems.go.th";
      final String auth_port = "25";
      final String auth_email = "anurut.s@niems.go.th";
      final String auth_password = "Anurut53011"; 
     
      */
      Properties props = new Properties();  
      props.put("mail.smtp.host", "mail1.niems.go.th");  
      props.put("mail.smtp.socketFactory.port", "25");  
      props.put("mail.smtp.socketFactory.class",  
                "javax.net.ssl.SSLSocketFactory");  
      props.put("mail.smtp.auth", "true");  
      props.put("mail.smtp.port", "25");  
       
      Session session = Session.getDefaultInstance(props,  
       new javax.mail.Authenticator() {  
       protected PasswordAuthentication getPasswordAuthentication() {  
       return new PasswordAuthentication("anurut.s@niems.go.th","Anurut53011");//change accordingly  
       }  
      });  
       
      //compose message  
      try {  
       MimeMessage message = new MimeMessage(session);  
       message.setFrom(new InternetAddress("anurut.s@niems.go.th"));//change accordingly  
       message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
       message.setSubject("Hello");  
       message.setText("Testing.......");  
         
       //send message  
       Transport.send(message);  
      
       System.out.println("message sent successfully");  
       
      } catch (MessagingException e) {throw new RuntimeException(e);}  
       
     }  
    }  