<%@page import="com.jun.model.BoardVO"%>
<%@page import="com.jun.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<% // 	\n은 EL/JSTL에서도 문자열로 인식을 못함
   // 변수 선언하여 사용 EL 사용 못하기에 scope 영역중 하나에 저장하기 
	pageContext.setAttribute("newLine", "\n");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<script  type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.slim.js"></script>
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
<body>
<%  MemberVO aaa = (MemberVO)session.getAttribute("result"); %>
<% BoardVO list =  (BoardVO)request.getAttribute("list"); %>
	<div class="container">
		<h2>자유게시판</h2>
		<div class="panel panel-default">
			<div class="panel-heading">자유게시판</div>
			<div class="panel-body">
			
				<table class="table table-hover">
					<tr>
						<td>제목</td>
						<td>${board.title}</td>
					</tr>

					<tr>
						<td>작성자</td>
						<td>${board.writer}</td>
					</tr>

					<tr>
						<td>내용</td>
						<%--<td>${fn:replace(대상문자열, 변경할내용, 변경후내용) }</td> --%>
						<td>${fn:replace(board.content,newLine,"<br>") }</td>
					</tr>

					<tr>
						<td>작성일</td>
						<td>${board.indate}</td>
					</tr>
						<tr>
							<td colspan="2">
							<button onclick="goDelete('${board.idx}','${board.writer}','${result.id}')" class="btn btn-sm btn-warning">삭제</button>
							<%-- <button onclick= "location.href = 'boardDelete.do?idx=${board.idx}&writer=${board.writer}'" class="btn btn-sm btn-info">컨트롤러 삭제</button> --%>
							<button onclick="goUpdate('${board.idx}')"class="btn btn-sm btn-info">수정</button>
							<button onclick="goMain()" class="btn btn-sm btn-success">메인으로</button>
						</td>
						
						
</tr>
						
				</table>
				
				
									<ul>
						<c:forEach var="reply" items="${com}" >
<li>
	<div>
		<p>${reply.writer} / ${reply.indate} <button  onclick="comDelete('${reply.cno}','${reply.idx}')"  >삭제</button></p>
		<p>${reply.content }</p>
	</div>
</li>	
</c:forEach>
						
						
						</ul>	
				
				
				
				
				
				<div>

	<form method="post" action="commentInsert.do">
	
		<p>
			<label>작성자</label> <input type="text" name="writer" value="${result.id}" readonly>
		</p>
		<p>
			<textarea rows="5" cols="50" name="content"></textarea>
		</p>
		<p>
			<input type="hidden" name="idx" value="${board.idx}">
			<button type="submit">등록</button>
		</p>
	</form>
	
</div>
				
	
		
	</div>
	
	
	
<script type="text/javascript">


function goMain() {
	location.href = "boardList.do";
}
/* function goDelete(idx) {			
	// 게시글을 삭제하는 Controller로 이동
	location.href = "boardDelete.do?idx="+idx;
}	 */

// AJAX 사용하지않고 컨트롤러 + 쿼리스트링으로도 할 수 있음
function goDelete(idx, writer, id) {			
	// 게시글을 삭제하는 Controller로 이동
	/* location.href = "boardDelete.do?idx="+idx   // "매핑값/"+보낼 값 쿼리스트링 */
	
	if(writer==id || id == "admin"){
	$.ajax({
		url : 'boardDelete.do', // 요청
		type : 'get', // 
		// dataType : 'json', // 응답내용이 무슨 형식인지
		data : { // 어떤 데이터를 보낼지
			"idx" : idx,
		},
		success : function(res) {
			location.href = "boardList.do";
			alert("성공적으로 삭제되었습니다.");
		
		
			

		},
		error : function(e) {
			alert("실패");
		}
	// 실패했을 때, 어떤코드가 실행이 될지

	});
	
	}else{alert("작성자만 삭제할 수 있습니다")}		
}	




function comDelete(cno, idx) {			
	// 게시글을 삭제하는 Controller로 이동
	/* location.href = "boardDelete.do?idx="+idx   // "매핑값/"+보낼 값 쿼리스트링 */
	
	
	$.ajax({
		url : 'commentDelete.do', // 어디로 요청할지
		type : 'get', // Get? Post?
		// dataType : 'json', // 응답내용이 무슨 형식인지
		data : { // 어떤 데이터를 보낼지
			"cno" : cno,
		},
		success : function(res) {
			window.location.reload();


			/* alert("삭제 되었습니다."); */
			alert("성공적으로 삭제되었습니다.");
			// 성공했을 때, 어떤코드가 실행이 될지
			// res --> 컨트롤러가 응답해준 내용이 담김 
			

		},
		error : function(e) {
			alert("실패");
		}
	// 실패했을 때, 어떤코드가 실행이 될지

	});
	
		
}	


















function goUpdate(idx){
	location.href = "boardUpdate.do?idx="+idx;
}

</script>




</body>
</html>

