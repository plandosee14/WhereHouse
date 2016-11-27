package com.WhereHouse.comment.persistence;

import java.util.List;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;

public interface CommentDAO {
	public void createComment(CommentVO vo)throws Exception;
	public void updateComment(CommentVO vo)throws Exception;
	public void deleteComment(int cno)throws Exception;
	public List<CommentVO> listComment(int hno)throws Exception;
	public List<CommentVO> listCommentPage(int hno, Criteria cri)throws Exception;
	public int countComment(int hno)throws Exception;
}
