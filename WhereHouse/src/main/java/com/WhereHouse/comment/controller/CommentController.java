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
	
	@RequestMapping(value="/all/{h_no}", method= RequestMethod.GET)
	public ResponseEntity<List<CommentVO>> list(@PathVariable("h_no") int h_no) {
		ResponseEntity<List<CommentVO>> entity = null;
		
		try {
			entity = new ResponseEntity<>(service.listComment(h_no), HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	
		}
		
		return entity;
	}
	
	@RequestMapping(value="/{c_no}", method={RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> update(@PathVariable("c_no") int c_no, @RequestBody CommentVO vo) {
		vo.setC_no(c_no);
		ResponseEntity<String> entity = null;
		
		try {
			service.modifyComment(vo);
			entity = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		
		return entity;
	}
	
	@RequestMapping(value="/{c_no}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("c_no") int c_no) {
		ResponseEntity<String> entity = null;
		try {
			service.removeComment(c_no);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/{h_no}/{page}", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listPage(@PathVariable("h_no") int h_no, @PathVariable("page") int page) {
		ResponseEntity<Map<String,Object>> entity = null;
		
		Criteria cri = new Criteria();//기본페이지 1페이지, 기본행의 개수: 10개
		
		cri.setPage(page);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		   
		Map<String,Object> map = new HashMap<>();
		
		try {
			List<CommentVO> list = service.listCommentPage(h_no, cri);
			map.put("list", list);
			
			int commentCount = service.count(h_no);
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
