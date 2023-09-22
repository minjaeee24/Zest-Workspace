package com.spring.comCode.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.comCode.vo.ComCodeVo;

public interface ComCodeService {

	public int comInsert(ComCodeVo com) throws Exception;
	
	public List<ComCodeVo> selectComCode() throws Exception;
	
	public List<BoardVo> codeFilter(PageVo pageVo) throws Exception;
	
}
