package com.jun.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
 
public class BoardVO {

//	글번호
	private int idx;

//	제목
	private String title;

//	작성자
	private String writer;

//	내용
	private String content;

//	작성일
	private String indate;

//	조회수
	private int count;




}
