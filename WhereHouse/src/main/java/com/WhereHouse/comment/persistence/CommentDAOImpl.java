package com.WhereHouse.comment.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.comment.domain.CommentVO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void createComment(CommentVO vo) throws Exception {
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
	}

	@Override
	public void deleteComment(int cno) throws Exception {
	}

	@Override
	public List<CommentVO> listComment(int hno) throws Exception {
		return null;
	}

	@Override
	public List<CommentVO> listCommentPage(int hno) throws Exception {
		return null;
	}

	@Override
	public int countComment(int hno) throws Exception {
		return 0;
	}

}
