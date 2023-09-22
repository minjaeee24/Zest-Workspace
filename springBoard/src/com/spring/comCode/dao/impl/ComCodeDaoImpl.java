package com.spring.comCode.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.comCode.dao.ComCodeDao;
import com.spring.comCode.vo.ComCodeVo;

@Repository
public class ComCodeDaoImpl implements ComCodeDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int comInsert(ComCodeVo comVo) throws Exception {
		return sqlSession.insert("comCode.comInsert", comVo);
	}
	
	public List<ComCodeVo> selectComCode() throws Exception {
		return sqlSession.selectList("comCode.selectComCode");
	}
	
	public List<BoardVo> codeFilter(PageVo pageVo) throws Exception{
		System.out.println(pageVo);
		return sqlSession.selectList("board.boardList", pageVo);
	}

}
