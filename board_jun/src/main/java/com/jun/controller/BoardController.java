package com.jun.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jun.mapper.BoardMapper;
import com.jun.model.BoardVO;import com.jun.model.CommentVO;
import com.jun.model.MemberVO;

@Controller
public class BoardController {

	@Autowired
	private BoardMapper mapper;

	
	
	
	
	
	// 로그인 하기 전 첫화면
	@RequestMapping("LoginMain.do")
	public String Login() {
		return "LoginMain";
	}

	// 로그인 후 화면
	@RequestMapping("Main.do")
	public String main() {
		return "Main";
	}

	// 회원가입 페이지로 가지는 컨트롤러
	@GetMapping("Join.do")
	public String Join() {

		return "Join";
	}

	// 회원가입 페이지에서 회원가입누르고 메인으로 가지는 컨트롤러
	@PostMapping("Join.do")
	public String Join(Model model, MemberVO member) {
		mapper.memberjoin(member);

		return "LoginMain";
	}

	// 로그인
	@PostMapping("Login.do")
	public String Login(HttpSession session, MemberVO member) {
		MemberVO result = mapper.memberLogin(member);

		if (result != null) {
			session.setAttribute("result", result);
			return "Main";

		} else {
			return "LoginMain";
		}

	}

	// 로그아웃
	@RequestMapping("Logout.do")
	public String Logout(HttpSession session) {
		session.removeAttribute("result");

		return "LoginMain";
	}

	// 회원탈퇴
	@RequestMapping("MemberDelete.do")
	public String MemberDelete(HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("result");
		String id = user.getId();

		mapper.memeberDelete(id);

		return "LoginMain";
	}

	// ------------------------------회원
	// 컨트롤러--------------------------------------------------------------------------------
	// 글 목록 보여주는 컨트롤러
	@RequestMapping("boardList.do")
	public String list(Model model) {
		List<BoardVO> list = mapper.boardList();
		model.addAttribute("list", list);

		return "boardList";
	}

	// 글쓰기 눌렀을 때 글쓰기 양식(폼)을 보여주는 컨트롤러
	@RequestMapping("boardForm.do")
	public String boardform() {
		return "boardForm";
	}

	// 글쓰기 폼에서 submit을 눌렀을 때 글 추가되는 컨트롤러
	@RequestMapping("boardInsert.do")
	public String boardInsert(BoardVO board) {


		mapper.boardinsert(board);

		return "redirect:/boardList.do";
	}

	// 글 제목 클릭 시 상세내용을 보여주는 컨트롤러
	@RequestMapping("boardContents.do")
	public String boardContent(int idx, Model model) {

		BoardVO board = mapper.boardcontents(idx);

		model.addAttribute("board", board);

		
		
		List<CommentVO> comment = mapper.Commentget(idx);
		model.addAttribute("com", comment);
		
		
		return "boardContents";
	}

	// 글 삭제 시키는 컨트롤러
	@RequestMapping("boardDelete.do")
	public @ResponseBody void boarddelete(int idx, HttpSession session) {
		// Path Variable
		// URL경로내에 데이터를 담아서 보내는 방식
		// urlMapping/{name} = "boardDelete.do/{idx}"
		// @PathVariable("name")
		System.out.println(idx + "글 삭제 컨트롤러 idx값");
		mapper.boarddelete(idx);

		// 컨트롤러에서 작성자 식별을 하는 것보다는 js에서 if문을 통한 작성자 식별이 더 깔끔하다.
	}

	// 굳이 만들자면 request_mapping으로 두 개 만들어도 될 듯?
	// GetMapping : 보통 페이지를 이동시킬 때 사용 a태그나 href는 get방식이 때문에
	// 상세보기에서 수정을 눌렀을 시 수정하는 폼으로 넘어가지는 컨트롤러 (페이지 이동 후 수정도 해야되니 request_mapping 말고
	// get으로 받는다.)
	@GetMapping("boardUpdate.do") // Get방식으로 요청한 경우에만 받아들임
	public String boardUpdate(int idx, Model model) {

		// 만약 메서드의 이름 == jsp의 이름이라면,
		// void로 메서드를 작성해도 페이지 이동을 시킬 수 있다.
		BoardVO board = mapper.boardcontents(idx);

		
		model.addAttribute("board", board);
		return "boardUpdate";
	}

	// 수정하는 폼에서 submit 눌렀을 때 글을 수정해주는 컨트롤러
	@PostMapping("boardUpdate.do") // Post방식으로 요청한 경우에만 받아들임
	public String boardUpdate(BoardVO board) {


		mapper.boardUpdate(board);

		// PostMapping : 정보를 받아와서 특정 기능을 실행시킬 때 사용
		return "redirect:/boardList.do";
	}

	
	
	
	
	  // 게시글 검색
	  @RequestMapping("boardSearch.do") 
	  public String Search(Model model ,String search) {
		  model.addAttribute("sear", search);
		  search = '%' + search + '%';
		  List<BoardVO> listt = mapper.search(search);
		  model.addAttribute("listt",listt);
	  
	  return "boardListt"; 
	  }
	 

	  // 댓글 
	  @RequestMapping("commentInsert.do")
	  public String comment(CommentVO vo) {
		  System.out.println("댓글");
		  mapper.CommentInsert(vo);
		  
		  return "redirect:/boardContents.do?idx="+vo.getIdx();
	  }
	  
	  
	  // 댓글 삭제
	  @RequestMapping("commentDelete.do")
	  public @ResponseBody void  commentdelete(int cno){
		  mapper.CommentDelete(cno);
		  
	  }
}
