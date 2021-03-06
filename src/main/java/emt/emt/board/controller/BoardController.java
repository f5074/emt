package emt.emt.board.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import emt.emt.board.service.BoardService;
import emt.emt.common.domain.Board;

@Controller
public class BoardController {
	@Autowired private BoardService boardService;
	

	//1_0 관리자용 게시판 관리 페이지 이동
	@RequestMapping("/admin/adminBoard")
	public String adminBoard(Model model) {
		return "admin/board/adminBoard";
	}

	//1_1 게시판 페이지 이동
	@RequestMapping("board")
	public String board(){
		
		return "user/board/boardList";
	}
	
	//1_2 게시판 불러오기
	@RequestMapping(value="boardList", method=RequestMethod.POST)
	@ResponseBody
	public List<Board> boardList(int type){
		// 페이지 숫자를 받아서 해당 데이터 가져옴
		return boardService.boardList(type);
	}
	
	//1_3 관리자용 게시판 불러오기
	@RequestMapping("admin/boardList")
	@ResponseBody
	public List<Board> adminBoardList(int type){
		// 페이지 숫자를 받아서 해당 데이터 가져옴
		return boardService.boardList(type);
	}
	
	//1_4 게시판 전체 숫자 불러오기
	@RequestMapping(value="boardCount", method=RequestMethod.POST)
	@ResponseBody
	public int boardCount(){
		
		return boardService.boardCount();
	}
	
	//1_5 관리자 게시판 게시글 삭제하기
	@RequestMapping(value="admin/board/adminBoardDelete", method=RequestMethod.POST)
	@ResponseBody
	public int adminBoardDelete(int boardNo, Board board){
		board.setBoardNo(boardNo);
		System.out.println(board.getBoardNo());
		
		return boardService.boardDelete(board);
	}
	
	//3_1 인덱스 최근 게시판목록
	@RequestMapping(value="indexBoardList")
	@ResponseBody
	public List<Board> indexBoardList(int type){
		// 페이지 숫자를 받아서 해당 데이터 가져옴
		return boardService.indexBoardList(type);
	}
	
	//4_1 글쓰기
	@RequestMapping("board/write")
	public String boardWrite(){
		return "user/board/boardWrite";
	}
	
	//4_2 글 등록하기
	@RequestMapping(value="board/addBoard", method=RequestMethod.POST)
	@ResponseBody
	public int boardAdd(HttpSession session, Board board, Model model){
		board.setUserId((String)session.getAttribute("sid"));
		int res=boardService.boardInsert(board);
		model.addAttribute("board", board);
		
		if(res == 1) {
			return board.getBoardNo();
		}
		else {
			return 0;
		}
	}
	
	//4_3 글 수정하기
		@RequestMapping(value="updateBoard", method=RequestMethod.POST)
		@ResponseBody
		public int updateBoard(Board board, Model model){
			int res=boardService.boardUpdate(board);
			model.addAttribute("board", board);
			
			return res;
		}
		
	//5_1 게시판 상세보기 페이지 이동
		@RequestMapping("boardDetailMove")
		public String noticeDetailMove(Board board, Model model){
			
			// 조회수 올리기
			boardService.hitPlus(board);
			
			model.addAttribute("boardNo", board.getBoardNo());
			
			board = boardService.boardView(board);
			model.addAttribute("boardUserId", board.getUserId());
			
			return "user/board/boardDetailView";
			
		}
		
	//5_2 게시판 상세보기
		@RequestMapping(value="boardDetailView", method=RequestMethod.POST)
		@ResponseBody
		public Board noticeDetailView(Board board, Model model){

			return boardService.boardView(board);
		}
		
	//5_3 게시판 수정하기
		@RequestMapping("boardModify")
		public String boardModify(Board board, Model model){
			
			model.addAttribute("boardNo", board.getBoardNo());
			
			return "user/board/boardModify";
			
		}
		
	//5_4 게시판 삭제하기
		@RequestMapping("boardDelete")
		@ResponseBody
		public int boardDelete(Board board, Model model){
			
			int res = boardService.boardDelete(board);
			return res;
		}
}
