package com.niems.dwh;

import java.util.*;
import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.*;
import javax.mail.Provider;
import javax.mail.internet.*;

public class main {

    public static void main(String[] args) {
    	
    	  /*
        final String auth_host = "mail1.niems.go.th";
        final String auth_port = "25";
        final String auth_email = "anurut.s@niems.go.th";
        final String auth_password = "Anurut53011"; 
       
        */
            final String username="kosit@goingjesse.com";
            final String password="nong010535546";
            Properties prop=new Properties();
            prop.put("mail.smtp.auth", "true");
            prop.put("mail.smtp.host", "smtp.gmail.com");
            prop.put("mail.smtp.port", "25");
            prop.put("mail.smtp.starttls.enable", "true");

            Session session = Session.getDefaultInstance(prop,
          new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
          }
        });
          try {
                 String body="Dear Renish Khunt Welcome";
                 String htmlBody = "<strong>This is an HTML Message</strong>";
                 String textBody = "This is a Text Message.";
         Message message = new MimeMessage(session);
         message.setFrom(new InternetAddress("nn.it@hotmail.com"));
                 message.setRecipients(Message.RecipientType.TO,InternetAddress.parse("receiver@gmail.com"));
        message.setSubject("Testing Subject");
        MailcapCommandMap mc = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
        mc.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
        mc.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
        mc.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
        mc.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
        mc.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
        CommandMap.setDefaultCommandMap(mc);
            message.setText(htmlBody);
                        message.setContent(textBody, "text/html");
            Transport.send(message);

            System.out.println("Done");

        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

}