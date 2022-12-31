<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
<h1>회원탈퇴</h1>
<form method="post" action="MemberDelete.do" name="passwdform"  onsubmit="return check('${result.pw}')">
<table>
<tr>
<td>비밀번호를 입력해주세요</td>
<th colspan="2">
<input type="text" name="pww" id="pww">
<input class="inputbutton" type="submit" value="탈퇴">
<input class="inputbutton" type="button" onclick="cancle()" value="탈퇴취소">
</th>
</tr>
</table>
</form>

<script type="text/javascript">

function check(pw) {
	var l = document.passwdform;
	var a = pw;
	var b = l.pww.value;
   
    
    
    if(a == b){
    	alert("탈퇴성공.");
    	l.pww.focus();
    	return true;
    }
    else if(b == ""){
    	alert("비밀번호를 입력해주세요");   	
    	l.pww.focus();
    	return false;
    }
    else{alert("비밀번호가 틀렸습니다.");   	
	l.pww.focus();
	return false;}
     
    
    
    
    
    
   
    	
    
    
    }
    
    
    
    
    
    
	
	
    


</script>
</body>
</html>