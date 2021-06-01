<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>월요일</title>
<link rel="stylesheet" href="css/main_v2.css"/>
<style>
/* 바디 */
/*로그인/회원가입 section*/
	section{
		width:100%;
		height: 2000px;
		background:red; 
	}
	.member{
		width: 345px;
		/* height: 500px; */
		/* background: pink; */
		margin: 0 auto;
		margin-top:131px;
		margin-bottom: 

	}
	input::placeholder{
		font-size: 15px;
		
	}
	input[type="text"], input[type="password"] { 
			height:50px;
            width:345px;
			font-size: 15px;
            margin-bottom: 5px;
            font-size: 20px;
	}
	
	#login_btn{
		height:50px;
        width:345px;
		background: #000;
		font-size: 20px;
		color: #fff;
	}
	
	.title{
		font-size: 50px;
/*		background: ;*/
		text-align: center;
		margin-bottom: 74px;
		

		
	}
	.login_txt1{
		margin-top:20px;
		font-size: 14px;
		width:345px;
		text-align: center;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
      $(document).ready(function(){
        
            
      });
</script>    
	
</head>

<body>
  <!--헤더페이지-->
<jsp:include page="header.jsp" flush="false"/>

	<div class="member">
		<p class="title">LOGIN</p><br>
		<!-- <form action="login_ok.jsp" method="post"> -->
		<form action="loginPro.jsp" method="post">
			<table>
				<tr>
					<td><input placeholder="email" type="text" name="email"></td>
				</tr>
				
				<tr>
					<td><input placeholder="password" type="password" name="password"></td>
				</tr>
				
				<tr>
					<td>
						<input type="submit" value="login" id="login_btn">
						&nbsp;&nbsp;&nbsp; 
						<p class="login_txt1"><a href="#"onclick="location.href='joinForm.jsp'">회원가입</a>	|	<a href="">아이디찾기</a>	|	<a href="">비밀번호찾기</a></p>
					</td>
				</tr>
			</table>
		</form>
		</div>
	<!--푸터페이지-->
<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
