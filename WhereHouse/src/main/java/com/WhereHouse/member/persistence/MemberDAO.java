package com.WhereHouse.member.persistence;

import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//�α���
public void register(MemberVO vo)throws Exception;//ȸ������
public String findID()throws Exception;//���̵�ã��
public void findPass()throws Exception;//��й�ȣã��
}
