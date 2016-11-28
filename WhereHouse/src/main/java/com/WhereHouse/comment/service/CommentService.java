package com.WhereHouse.comment.service;

import java.util.List;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;

public interface CommentService {
	public List<CommentVO> listComment(int hno)throws Exception;
	public void addComment(CommentVO vo) throws Exception;
	public void modifyComment(CommentVO vo) throws Exception;
	public void removeComment(int cno) throws Exception;
	
	public List<CommentVO> listCommentPage(int hno, Criteria cri)throws Exception;
	public int count(int hno) throws Exception;
	
}
