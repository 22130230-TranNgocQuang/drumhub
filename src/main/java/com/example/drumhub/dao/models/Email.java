package com.example.drumhub.dao.models;

import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

public class Email {
    public static void sendVerificationEmail(String toEmail, String verificationLink) {
        final String fromEmail = "drumhub2004@gmail.com";
        final String password = "ziza whrm wivk jxxz";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Xác thực tài khoản Google");
            message.setText("Chào bạn,\n\nVui lòng nhấn vào link sau để xác thực tài khoản:\n" + verificationLink);

            Transport.send(message);
            System.out.println("Gửi email xác thực thành công tới: " + toEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
}
