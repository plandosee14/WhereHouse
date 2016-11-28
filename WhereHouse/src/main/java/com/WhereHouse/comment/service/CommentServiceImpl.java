package com.WhereHouse.comment.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;
import com.WhereHouse.comment.persistence.CommentDAO;

@Service
public class CommentServiceImpl implements CommentService {

	@Inject
	private CommentDAO dao;
	
	@Override
	public List<CommentVO> listComment(int hno) throws Exception {
		return dao.listComment(hno);
	}

	@Override
	public void addComment(CommentVO vo) throws Exception {
		dao.createComment(vo);
	}

	@Override
	public void modifyComment(CommentVO vo) throws Exception {
		dao.updateComment(vo);
	}

	@Override
	public void removeComment(int cno) throws Exception {
		dao.deleteComment(cno);
	}

	@Override
	public List<CommentVO> listCommentPage(int hno, Criteria cri) throws Exception {
		return dao.listCommentPage(hno, cri);
	}

	@Override
	public int count(int hno) throws Exception {
		return dao.countComment(hno);
	}

}
