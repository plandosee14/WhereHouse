package com.WhereHouse.comment.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void createComment(CommentVO vo) throws Exception {
		int t = sqlSession.insert("comment.create", vo);
	}

	@Override
	public void updateComment(CommentVO vo) throws Exception {
		sqlSession.update("comment.update", vo);
	}

	@Override
	public void deleteComment(int c_no) throws Exception {
		sqlSession.delete("comment.delete", c_no);
	}

	@Override
	public List<CommentVO> listComment(int h_no) throws Exception {
		return sqlSession.selectList("comment.list", h_no);
	}

	@Override
	public List<CommentVO> listCommentPage(int h_no, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("comment.list", h_no, bound);
	}

	@Override
	public int countComment(int h_no) throws Exception {
		return sqlSession.selectOne("comment.count", h_no);
	}

}
