package com.spring.comCode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.comCode.dao.ComCodeDao;
import com.spring.comCode.service.ComCodeService;
import com.spring.comCode.vo.ComCodeVo;

@Service
public class ComCodeServiceImpl implements ComCodeService{
	
	@Autowired
	ComCodeDao comDao;
	
	public int comInsert(ComCodeVo comVo) throws Exception{
		return comDao.comInsert(comVo);
	}
	
	public List<ComCodeVo> selectComCode() throws Exception{
		return comDao.selectComCode();		
	}
	
	public List<BoardVo> codeFilter(PageVo pageVo) throws Exception{
		return comDao.codeFilter(pageVo);
	}
}
