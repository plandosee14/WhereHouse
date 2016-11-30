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
	public List<CommentVO> listComment(int h_no) throws Exception {
		return dao.listComment(h_no);
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
	public void removeComment(int c_no) throws Exception {
		dao.deleteComment(c_no);
	}

	@Override
	public List<CommentVO> listCommentPage(int h_no, Criteria cri) throws Exception {
		return dao.listCommentPage(h_no, cri);
	}

	@Override
	public int count(int h_no) throws Exception {
		return dao.countComment(h_no);
	}

}
