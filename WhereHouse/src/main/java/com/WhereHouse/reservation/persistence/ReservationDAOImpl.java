package com.WhereHouse.reservation.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.reservation.domain.ReservationDateVO;
import com.WhereHouse.reservation.domain.ReservationVO;

@Repository
public class ReservationDAOImpl implements ReservationDAO {
	
	@Inject
	private SqlSession sqlSession;
	//�����ϱ�
	@Override
	public void insertReservation() throws Exception {
		// TODO Auto-generated method stub

	}

	//�Ͽ콺�� ������ ��������
	@Override
	public List<ReservationVO> selectReservation(int h_no) throws Exception {
		
		return sqlSession.selectList("reservation.selectReservationByHno",h_no);
	}

	//�Ͽ콺�� ����Ұ����� ��¥ ��������
	@Override
	public List<ReservationDateVO> selectReservationDate(int h_no) throws Exception {
		
		return sqlSession.selectList("reservation.selectReservationDate", h_no);
	}
	


}
