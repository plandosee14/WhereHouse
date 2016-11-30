package com.WhereHouse.comment.persistence;

import java.util.List;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;

public interface CommentDAO {
	public void createComment(CommentVO vo)throws Exception;
	public void updateComment(CommentVO vo)throws Exception;
	public void deleteComment(int c_no)throws Exception;
	public List<CommentVO> listComment(int h_no)throws Exception;
	public List<CommentVO> listCommentPage(int h_no, Criteria cri)throws Exception;
	public int countComment(int h_no)throws Exception;
}
