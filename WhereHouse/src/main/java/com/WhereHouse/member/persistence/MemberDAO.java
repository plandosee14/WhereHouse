package com.WhereHouse.member.persistence;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//�α���
public void register(MemberVO vo)throws Exception;//ȸ������
public String findID(MemberVO vo)throws Exception;//���̵�ã��
public String findPass(String m_id)throws Exception;//���ã��
public void updatePass(MemberVO vo)throws Exception;//��� �ٲٱ�
}
