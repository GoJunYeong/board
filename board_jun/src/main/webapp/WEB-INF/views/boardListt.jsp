<%@page import="com.jun.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.jun.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>





<!DOCTYPE html>
<html>
<head>
<title>연습</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<style type="text/css">

#dis {

margin-left: 1470px;
}


</style>

</head>
<body>
	


<div id="dis">
<h5>   ${result.id}님</h5>
<h5>   <a href="Logout.do">로그아웃</a></h5>
<h5>   <a href="MemberDelete.do">회원탈퇴</a></h5>
</div>


		<div class="container">
			<h2>자유게시판</h2>
			<div class="panel panel-default">
				<div class="panel-heading"><a href ="boardList.do">첫 화면으로 돌아가기</a></div>
				<div class="panel-body">

					<table class="table table-hover table-bordered">
						<tr>
							<td colspan="6">
								<div class="col-sm-10">
									<input class="form-control" type="text" id="search" value ="${sear}">
								</div>
								<div class="col-sm-2">
									<button id="searchBtn" onclick="boardSearch()"
										class="btn btn-success">검색</button>
								</div>
							</td>
						</tr>









						<%-- 		  <% request.getAttribute("list");
List<BoardVO> list = (List<BoardVO>) request.getAttribute("list");
%> --%>

						<tr>

							<td>글번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>내용</td>
							<td>작성일</td>
							<td>조회수</td>
						</tr>

						<c:forEach var="dto" items="${listt}">
							<tr>

								<%-- ${dto.idx} = out.print(dto.getIdx()) --%>
								<td>${dto.idx}</td>
								<td><a href="boardContents.do?idx=${dto.idx}">${dto.title}</a></td>
								<td>${dto.writer}</td>
								<td>${dto.content}</td>
								<td>${dto.indate}</td>
								<td>${dto.count}</td>
							</tr>
						</c:forEach>
					</table>
					<button onclick="location.href='boardForm.do'"
						class="btn btn-sm btn-info">글쓰기</button>

				</div>
				<div class="panel-footer">자유게시판</div>
			</div>
		</div>
		
		
	<script type="text/javascript">
	$('#searchBtn').on('click',function(){
		if($('#search').val()!==""){
		var search = $('#search').val();
		location.href = "boardSearch.do?search="+search;
		alert("검색완료");
		}else{alert("검색어를 입력해주세요");}
	})
	</script>
		
</body>
</html>