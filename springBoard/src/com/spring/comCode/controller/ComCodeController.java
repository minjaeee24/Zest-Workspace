package com.spring.comCode.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.PageVo;
import com.spring.comCode.service.ComCodeService;
import com.spring.comCode.vo.ComCodeVo;
import com.spring.common.CommonUtil;

@Controller
public class ComCodeController {
	
	@Autowired 
	ComCodeService comService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// « ≈Õ∏µ(ajax)
	@RequestMapping(value="/comCode/comCodeFilter.do", method=RequestMethod.POST, produces = "application/text; charset=EUC-KR")
	@ResponseBody
	public String codeFilter(Locale locale, PageVo pageVo, ComCodeVo comCodeVo, HttpServletRequest request) throws Exception{
		
		//request.setCharacterEncoding("UTF-8");
		
		int page = 1;
		int totalCnt = 0;
		System.out.println(pageVo);
		System.out.println(pageVo.getPageNo());
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		HashMap<String, String> result = new HashMap<String, String>();

		System.out.println(pageVo);
		
		List<BoardVo> resultCnt = comService.codeFilter(pageVo);
		
		System.out.println(resultCnt);
		
		String resultSet = CommonUtil.toJson(resultCnt);
				
		System.out.println(resultSet);
		
		return resultSet;
	}

	
	
}
