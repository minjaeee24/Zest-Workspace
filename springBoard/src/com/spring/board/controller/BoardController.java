package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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
public class BoardController {
	
	@Autowired 
	boardService boardService;
	@Autowired
	ComCodeService comService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 동기식 게시글 목록 조회
	// (지금은 ComCodeController에서 비동기로 한번에 처리)
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model, PageVo pageVo, String[] filter) throws Exception{
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
//		PageVo pageVo = new PageVo();
//		pageVo.setPageNo(pageNo == null ? 0 : Integer.valueOf(pageNo));
		/*
		 * if(filter!= null) { System.out.println(filter.length); }
		 */
		
		int page = 1;
		int totalCnt = 0;
		System.out.println(pageVo);
		System.out.println(pageVo.getPageNo());
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		List<ComCodeVo> comCode = comService.selectComCode();
		System.out.println(comCode);
		System.out.println(boardList);
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("comCode", comCode);
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	// 게시글 조회
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	
	// 게시글 작성 페이지
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model) throws Exception{
		
		List<ComCodeVo> comCode = comService.selectComCode();
		
		model.addAttribute("comCode", comCode);

		return "board/boardWrite";
	}
	
	// 게시글 작성
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo, ComCodeVo comVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		System.out.println(boardVo);
		System.out.println(comVo);
		boardVo.setBoardType(comVo.getCodeId());
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
			
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping(value = "/board/boardEdit.do", method = RequestMethod.GET) // ��üget, post����
	public String boardEdit(Locale locale, Model model, String boardType, int boardNum) throws Exception{
		System.out.println(boardType);
		BoardVo board = boardService.selectEditBoard(boardType, boardNum);
		List<ComCodeVo> comCode = comService.selectComCode();
		
		model.addAttribute("board", board);
		model.addAttribute("comCode", comCode);
		
		return "board/boardEdit";
	}
	
	// 게시글 수정
	@RequestMapping(value="/board/boardEditAction.do", method=RequestMethod.POST)
	@ResponseBody
	public String boardEditAction(Locale locale,BoardVo boardVo, ComCodeVo comVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		System.out.println(boardVo);		
		
		//boardVo.setBoardType(comVo.getCodeId());
		
		int resultCnt = boardService.boardEdit(boardVo);
				
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
				
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	// 게시글 삭제
	@RequestMapping(value="board/boardDelete.do", method = RequestMethod.GET)
	@ResponseBody
	public String boardDelete(BoardVo boardVo) throws Exception {
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		System.out.println(boardVo);
		
		int resultCnt = boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		System.out.println(result);
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
				
		System.out.println("callbackMsg::"+callbackMsg);

		// 동기식 처리
//		if(result > 0) {
//			return "redirect:/board/boardList.do";
//		}else {
//			return "redirect:/board/boardList.do";
//		}
		
		return callbackMsg;
		
	}
	
	// mbti 메인페이지
	@RequestMapping(value = "/board/mbti.do", method = RequestMethod.GET)
	public String mbtiMain() throws Exception{
		
		
		return "board/mbtiMain";
	}
	
	// mbti test페이지 이동
	@RequestMapping(value = "/board/mbtiTest.do", method = RequestMethod.GET)
	public String mbtiTest(Model model) throws Exception{
		
		List<BoardVo> list = boardService.selectMbtiList();
		
		model.addAttribute("list", list);
		
		return "board/mbtiTest";
	}
	
	
	// mbti result
	@RequestMapping(value = "/board/mbtiResult.do", method = RequestMethod.GET)
	@ResponseBody
	public String mbtiResult(Model model
									, @RequestParam("mbti") String mbti) throws Exception{
		
		String MBTI = CommonUtil.toJson(mbti);
		
		System.out.println(MBTI);
		
		return MBTI;
	}
	
	// mbti result페이지 이동
	@RequestMapping(value = "/board/mbtiResultPage.do", method = RequestMethod.GET)
	public String mbtiResultPage(Model model, String result) throws Exception{
		
		System.out.println(result);
		
		model.addAttribute("result", result);
		
		return "board/mbtiResult";
	}
	
	
}
