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
		return dao.login(vo);// ���� m_no, m_name, m_id
	}

	@Override
	public void register(MemberVO vo) throws Exception {
		Encryption enc = new Encryption("chlvlfgkschlvlfgks");
		vo.setM_pass(enc.aesEncode(vo.getM_pass()));
		dao.register(vo);
	}

	@Override
	public String findID(MemberVO vo) throws Exception {
		return dao.findID(vo).substring(0, dao.findID(vo).length() - 3) + "***";
	}

	@Override
	public String findPass(MemberVO vo) throws Exception {
		StringBuffer buffer = new StringBuffer();
		if (dao.findPass(vo.getM_id()) == null || dao.findPass(vo.getM_id()).equals("")) {
			System.out.println(dao.findPass(vo.getM_id()));
			return "0";
		} else {
			for (int i = 0; i <= 6; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			vo.setM_pass(new Encryption("chlvlfgkschlvlfgks").aesEncode(buffer.toString()));
			dao.updatePass(vo);
			String sender = "scv852456@gmail.com"; // ������ �����ּ� ���۷� �Է�
			String receiver = vo.getM_id();
			String subject = "WhereHouse ���ο� ��й�ȣ�Դϴ�. \n ���ο� ��й�ȣ�� �α��� ���ֽñ� �ٶ��ϴ�!";
			String content = "���ο� ��й�ȣ�� [" + buffer.toString() + "] �Դϴ�. ";

			// ������ ��� ���� ��ü
			Properties p = new Properties();

			// SMTP ������ ���� ����
			// Naver�� ������ ��� ���̹� ���̵� ����
			// Google�� ������ ��� ������ Gmail �ּ�
			p.put("mail.smtp.user", "scv852456@gmail.com");

			// SMTP ���� ���� ����
			// ���̹��� ��� smtp.naver.com
			// Google�� ��� smtp.gmail.com
			p.put("mail.smtp.host", "smtp.gmail.com");

			// �Ʒ� ������ ���̹��� ������ �����ϹǷ� �������� ������.
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

				// ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
				ses.setDebug(true);

				// ������ ������ ��� ���� ��ü
				MimeMessage msg = new MimeMessage(ses);

				// ���� ����
				msg.setSubject(subject);

				// ������ ����� �����ּ�
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);

				// �޴� ����� �����ּ�
				Address toAddr = new InternetAddress(receiver);
				msg.addRecipient(Message.RecipientType.TO, toAddr);

				// �޽��� ������ ����� ����, ĳ���� �� ����
				msg.setContent(content, "text/html;charset=UTF-8");

				// �߼��ϱ�
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
		if (dao.findPass(m_id) == null || dao.findPass(m_id).equals("")) {//ȸ���������� ���� �̸���
			for (int i = 0; i <= 6; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}

			String sender = "scv852456@gmail.com"; // ������ �����ּ� ���۷� �Է�
			String receiver = m_id;
			String subject = "WhereHouse ���� ��ȣ �Դϴ�. \n ���� ��ȣ�� �Է��� �ּ���!";
			String content = "������ȣ�� [" + buffer.toString() + "] �Դϴ�. ";

			// ������ ��� ���� ��ü
			Properties p = new Properties();

			// SMTP ������ ���� ����
			// Naver�� ������ ��� ���̹� ���̵� ����
			// Google�� ������ ��� ������ Gmail �ּ�
			p.put("mail.smtp.user", "scv852456@gmail.com");

			// SMTP ���� ���� ����
			// ���̹��� ��� smtp.naver.com
			// Google�� ��� smtp.gmail.com
			p.put("mail.smtp.host", "smtp.gmail.com");

			// �Ʒ� ������ ���̹��� ������ �����ϹǷ� �������� ������.
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

				// ������ ������ �� ���� ��Ȳ�� �ֿܼ� ����Ѵ�.
				ses.setDebug(true);

				// ������ ������ ��� ���� ��ü
				MimeMessage msg = new MimeMessage(ses);

				// ���� ����
				msg.setSubject(subject);

				// ������ ����� �����ּ�
				Address fromAddr = new InternetAddress(sender);
				msg.setFrom(fromAddr);

				// �޴� ����� �����ּ�
				Address toAddr = new InternetAddress(receiver);
				msg.addRecipient(Message.RecipientType.TO, toAddr);

				// �޽��� ������ ����� ����, ĳ���� �� ����
				msg.setContent(content, "text/html;charset=UTF-8");

				// �߼��ϱ�
				Transport.send(msg);

			} catch (Exception mex) {
				mex.printStackTrace();
			}
			return buffer.toString();
		} else {//�̹� ���Ե� �̸���
			return "0";
		}
	}

}