<%@page import="com.jun.model.MemberVO"%>
<%@page import="com.jun.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="com.jun.model.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<style type="text/css">

#dis1{


margin-bottom : 70px;
}


#dis {
text-align: center;
/* margin-left: 150px;
margin-bottom : 80px; */
}


body {
  margin: 0;
  padding: 0;
  
  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 120px;
  max-width: 600px;
  height: 320px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}


</style>
</head>
<body>
 <%  MemberVO aaa = (MemberVO)session.getAttribute("result"); %> 
<%-- <h1> <%= aaa.getId()%>님 환영합니다.</h1>
<h1>   ${result.id}님 환영합니다.</h1> --%>





<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                    
                        <div>
                        <br>
                        <br>
                            <h2 class="text-center text-info" id="dis1" ><%= aaa.getId()%>님 환영합니다.</h2>
                            <div class="form-group" id="dis" >
                            
                            
                            <br>
                            <br>
                            <br>
                            
                            <a href="boardList.do">자유게시판</a>&nbsp;&nbsp;
                            <a href="Logout.do">로그아웃   </a>&nbsp;
                            <a href="MemberDelete.do">회원탈퇴</a>
                                   
									      
									 
                            </div>
                      </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>























</body>
</html>