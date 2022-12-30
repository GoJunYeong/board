package com.jun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.jun.model.BoardVO;
import com.jun.model.CommentVO;
import com.jun.model.MemberVO;

@Mapper
public interface BoardMapper {
		// dao
		//추상메소드 만들기
		// 하나만 가져올 경우 BoardVO
		// 여러개 가져올 경우 List<Board>

	
	
	public List<BoardVO> boardList();
	
	
	public int boardinsert(BoardVO board);
	
	public BoardVO boardcontents(int idx);
	
	public void boarddelete(int idx);
	
	public int boardUpdate(BoardVO board);

	public List<BoardVO> boardSearch(String search);
	
	public int memberjoin(MemberVO member);

	public MemberVO memberLogin(MemberVO member);
	
	public void memeberDelete(String id);
	
	public List<BoardVO> search(String search);
	
	
	
	
	
	// 댓글 등록
	public void CommentInsert(CommentVO vo);
	
	// 댓글 가져오기
	public List<CommentVO> Commentget(int idx);
	
	// 댓글 수
	public int getTotal(int cno);
	
	public void CommentDelete(int cno);
	
	
	
	
}

