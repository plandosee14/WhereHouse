package com.WhereHouse.member.domain;

import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends javax.mail.Authenticator{
	public PasswordAuthentication getPasswordAuthentication() {
       return new PasswordAuthentication("scv852456", "cc136982!!");
   }
}
