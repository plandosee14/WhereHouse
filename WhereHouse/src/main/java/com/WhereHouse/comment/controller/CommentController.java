package com.WhereHouse.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.WhereHouse.comment.domain.CommentVO;
import com.WhereHouse.comment.domain.Criteria;
import com.WhereHouse.comment.domain.PageMaker;
import com.WhereHouse.comment.service.CommentService;
@RestController
@RequestMapping("/comments")
public class CommentController {
	
	@Inject
	private CommentService service;
	
	@RequestMapping(value="", method=RequestMethod.POST)
	public ResponseEntity<String> reqister(@RequestBody CommentVO vo){
		ResponseEntity<String> entity =null;
		try {
			service.addComment(vo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{cno}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("cno") int cno) {
		ResponseEntity<String> entity = null;
		try {
			service.removeComment(cno);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{hno}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("hno") int hno, @PathVariable("page") int page) {
		ResponseEntity<Map<String,Object>> entity = null;
		
		Criteria cri = new Criteria();//기본페이지 1페이지, 기본행의 개수: 10개
		
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		   
		Map<String,Object> map = new HashMap<>();
		
		try {
			List<CommentVO> list = service.listCommentPage(hno, cri);
			map.put("list", list);
			
			int commentCount = service.count(hno);
			pageMaker.setTotalCount(commentCount);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}
