package com.sigma.service;

import java.nio.charset.Charset;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

/**
 * @author Nikodem
 * 
 */
@Service
public class MailService
{
	@Autowired
	JavaMailSender emailSender;
	
	/**
	 * Sends a email message that contains the values specified in parameters 
	 * @param imie name of customer
	 * @param text text in the email
	 * @param email email of the costumer
	 */
	public void sendSimpleMessage(String imie, String text, String email) {
				
		        MimeMessage message = emailSender.createMimeMessage();
		        try {
					message.setRecipient(RecipientType.TO, new InternetAddress("sigma.sigma@wp.pl"));
					message.setSubject(imie + " - " + email, "UTF-8"); 
			        message.setText(new String(text.getBytes(Charset.forName("UTF-8"))));
			        
				} catch (AddressException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (MessagingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
		        emailSender.send(message);
		        
		    }
}
