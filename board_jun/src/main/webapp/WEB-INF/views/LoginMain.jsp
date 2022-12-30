<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<style type="text/css">
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
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <div id="login">
        <h3 class="text-center text-white pt-5">Login form</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                    
                        <form id="login-form" class="form" action="Login.do" method="post">
                            <h3 class="text-center text-info">로그인</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">아이디</label><br>
                                <input type="text" name="id" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">비밀번호</label><br>
                                <input type="password" name="pw" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="로그인">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="Join.do" class="text-info">회원가입</a>
                            </div>
                        </form>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>