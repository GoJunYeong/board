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
			<div class="panel-heading">게시글 작성</div>
			<div class="panel-body">
				<!-- /web/boardInsert.do  -->




				<form class="form-horizontal" action="boardInsert.do" method="post"  name="sub"   onsubmit="return check()">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title"
								 name="title" >
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="writer"
								placeholder="Enter writer" name = "writer" value="${result.id}" readonly>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용:</label>
						<div class="col-sm-10">
							<textarea rows="10" class="form-control" name="content"
								id="content"></textarea>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default" id="ss">등록</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">insert</div>
		</div>
	</div>
	<script type="text/javascript">
	  function check() {
	       
	        var f = document.sub;

	         // 제목이 공백이면
	        if (f.title.value == "") {
	            alert("제목을 입력해주십시오");
	            f.title.focus();
				console.log(f);
	            return false;
	        }// 내용이 공백이면 
	         if (f.content.value == "") {
	            alert("내용을 입력해주십시오");
	            f.content.focus();
				console.log(f);
	            return false;
	         
	}
	  }
	</script>
	
</body>
</html>
