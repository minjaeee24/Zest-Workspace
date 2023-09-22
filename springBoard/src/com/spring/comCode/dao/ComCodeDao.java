package com.spring.comCode.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.comCode.vo.ComCodeVo;

public interface ComCodeDao {

	public int comInsert(ComCodeVo comVo) throws Exception ;
	
	public List<ComCodeVo> selectComCode() throws Exception ;
	
	public List<BoardVo> codeFilter(PageVo pageVo) throws Exception;
}
