package com.jun.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
 
public class CommentVO {

	private int idx;
	private int cno;
	private String writer;
	private String content;
	private String indate;
		
	
	
}
