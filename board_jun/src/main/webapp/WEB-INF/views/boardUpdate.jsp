<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<h2>자유게시판</h2>
		<div class="panel panel-default">
			<div class="panel-heading">글 수정 페이지</div>
			<div class="panel-body">
				<!-- /web/boardInsert.do  -->
				<form class="form-horizontal" action="boardUpdate.do"
					method="post">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								placeholder="Enter title" value=${board.title } name="title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
						<div class="col-sm-10">
						<!-- 
						disabled : button / input 태그를 못쓰게 하는 속성, 데이터도 보내지지 않음,  읽기 O, 값 변경 X, 값 전송 X
						readonly : 읽기 O, 값 변경 X, 값 전송 O						
						-->
							<input readonly type="text" class="form-control" id="writer"
								placeholder="Enter writer" value=${board.writer } name="writer">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea rows="10" class="form-control" name="content"
								id="content">${board.content }</textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">수정</button>
						</div>
					</div>
					<input type="hidden" name="idx" value=${board.idx }>
					
				</form>
			</div>
			<div class="panel-footer">고준영</div>
		</div>
	</div>

</body>
</html>
