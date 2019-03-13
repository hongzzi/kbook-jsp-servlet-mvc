package controller;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;


public class Email {
	public boolean sendEmail(String email, String authNum){
		try {
			 String host = "smtp.naver.com";
		        final String username = "dlwlgus67";       //?„¤?´ë²? ?´ë©”ì¼ ì£¼ì†Œì¤? @ naver.com?•ì£¼ì†Œë§? ê¸°ì¬?•©?‹ˆ?‹¤.
		        final String password = "JHMS10ve";   //?„¤?´ë²? ?´ë©”ì¼ ë¹„ë?ë²ˆí˜¸ë¥? ê¸°ì¬?•©?‹ˆ?‹¤.
		        int port=465;
		         
		        // ë©”ì¼ ?‚´?š©
		        String recipient = email;    //ë©”ì¼?„ ë°œì†¡?•  ?´ë©”ì¼ ì£¼ì†Œë¥? ê¸°ì¬?•´ ì¤ë‹ˆ?‹¤.
		        String subject = "144210 È¸¿ø°¡ÀÔ ÀÎÁõ¸ŞÀÏ.";
		        String body = authNum;
		         
		        Properties props = System.getProperties();
		          
		          
		        props.put("mail.smtp.host", host);
		        props.put("mail.smtp.port", port);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.ssl.trust", host);
		           
		        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		            String un=username;
		            String pw=password;
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication("dlwlgus67", "JHMS10ve");
		            }
		        });
		        session.setDebug(true); //for debug 
		           
		        Message mimeMessage = new MimeMessage(session);
		        
		        mimeMessage.setFrom(new InternetAddress("dlwlgus67@naver.com","144210","UTF-8"));
		        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient,recipient,"UTF-8"));
		        mimeMessage.setSubject(subject);
		        mimeMessage.setText(body);
		        Transport.send(mimeMessage);

		}catch(MessagingException e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e.toString());
		}
		return true;
	}

	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<=6; i++) {
			int n=(int)(Math.random()*10);
			buffer.append(n);
		}
		return buffer.toString();
	}
}
