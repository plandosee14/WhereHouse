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
	public void deleteComment(int cno) throws Exception {
		sqlSession.delete("comment.delete", cno);
	}

	@Override
	public List<CommentVO> listComment(int hno) throws Exception {
		return sqlSession.selectList("comment.list", hno);
	}

	@Override
	public List<CommentVO> listCommentPage(int hno, Criteria cri) throws Exception {
		RowBounds bound = new RowBounds(cri.getPageStart(), cri.getPerPageNum());
		return sqlSession.selectList("comment.list", hno, bound);
	}

	@Override
	public int countComment(int hno) throws Exception {
		return sqlSession.selectOne("comment.count", hno);
	}

}
