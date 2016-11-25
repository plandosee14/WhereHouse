package com.WhereHouse.member.service;

import java.util.Properties;

import javax.inject.Inject;
import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.WhereHouse.member.domain.Encryption;
import com.WhereHouse.member.domain.MemberVO;
import com.WhereHouse.member.domain.SMTPAuthenticator;
import com.WhereHouse.member.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		vo.setM_pass(new Encryption("chlvlfgkschlvlfgks").aesEncode(vo.getM_pass()));
		return dao.login(vo);// 리턴 m_no, m_name, m_id
	}

	@Override
	public void register(MemberVO vo) throws Exception {
		Encryption enc = new Encryption("chlvlfgkschlvlfgks");
		vo.setM_pass(enc.aesEncode(vo.getM_pass()));
		dao.register(vo);
	}

	@Override
	public String findID(MemberVO vo) throws Exception {
		if (dao.findID(vo)==null||dao.findID(vo).equals("")) {
			return "";
		}else {
			return dao.findID(vo).substring(0, dao.findID(vo).indexOf("@") - 3) + "***" + dao.findID(vo).substring(dao.findID(vo).indexOf("@"), dao.findID(vo).length());
		}
	}

	@Override
	public String findPass(MemberVO vo) throws Exception {
		StringBuffer buffer = new StringBuffer();
		if (dao.passupdateselect(vo)==null || dao.passupdateselect(vo).equals("")) {
			System.out.println(dao.passupdateselect(vo));
			return "0";
		} else {
			for (int i = 0; i <= 6; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			vo.setM_pass(new Encryption("chlvlfgkschlvlfgks").aesEncode(buffer.toString()));
			dao.updatePass(vo);
			String sender = "scv852456@gmail.com";
			String receiver = vo.getM_id();
			String subject = "WhereHouse 새로운 비밀번호입니다. \n 새로운 비밀번호로 로그인 해주시기 바랍니다!";
			String content = "새로운 비밀번호는 [" + buffer.toString() + "] 입니다. ";
			Properties p = new Properties();
			p.put("mail.smtp.user", "scv852456@gmail.com");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			try {
				Authenticator auth = new SMTPAuthenticator();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(receiver);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
			} catch (Exception mex) {
				mex.printStackTrace();
			}
			return buffer.toString();
		}
	}

	@Override
	public String checkID(String m_id) throws Exception {
		StringBuffer buffer = new StringBuffer();
		System.out.println("serviceImpl/findpass="+m_id);
		if (dao.findPass(m_id) == null || dao.findPass(m_id).equals("")) {//회원가입하지 않은 이메일
			for (int i = 0; i <= 6; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			String sender = "scv852456@gmail.com";
			String receiver = m_id;
			String subject = "WhereHouse 인증 번호 입니다. \n 인증 번호를 입력해 주세요!";
			String content = "인증번호는 [" + buffer.toString() + "] 입니다. ";
			Properties p = new Properties();
			p.put("mail.smtp.user", "scv852456@gmail.com");
			p.put("mail.smtp.host", "smtp.gmail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");
			try {
				Authenticator auth = new SMTPAuthenticator();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(receiver);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(content, "text/html;charset=UTF-8");
				Transport.send(msg);
			} catch (Exception mex) {
				mex.printStackTrace();
			}
			return buffer.toString();
		} else {//이미 가입된 이메일
			return "0";
		}
	}

}
