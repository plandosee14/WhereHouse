package com.WhereHouse.member.service;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberService {
	public MemberVO login(MemberVO vo)throws Exception;//�α���
	public void register(MemberVO vo)throws Exception;//ȸ������
	public String findID(MemberVO vo)throws Exception;//���̵�ã��
	public String findPass(MemberVO vo)throws Exception;//���ã��
	public String checkID(String m_id)throws Exception;//�̸��� üũ(����)
}
