package com.WhereHouse.member.persistence;

import java.util.List;

import com.WhereHouse.house.domain.HouseVO;
import com.WhereHouse.house.domain.HousedistanceVO;
import com.WhereHouse.house.domain.locationVO;
import com.WhereHouse.member.domain.MemberVO;

public interface MemberDAO {
public MemberVO login(MemberVO vo)throws Exception;//�α���
public void register(MemberVO vo)throws Exception;//ȸ������
public String findID(MemberVO vo)throws Exception;//���̵�ã��
public String findPass(String m_id)throws Exception;//���ã��
public void updatePass(MemberVO vo)throws Exception;//��� �ٲٱ�
public String passupdateselect(MemberVO vo)throws Exception;//��� �ٲ� ���̵� ã��
public List<HouseVO> searchHouse(HouseVO vo)throws Exception;//���˻�
public List<HousedistanceVO> searchnearHouse(locationVO vo)throws Exception;//�ֺ����˻�

}
