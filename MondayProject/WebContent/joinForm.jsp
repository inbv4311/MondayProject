<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title> Sign up </title>
<!-- <link rel="stylesheet" href="css/main_v2.css"/> -->
<style>
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
	
	.login_btn{
		height:50px;
        width:345px;
		background: #000;
		font-size: 20px;
		color: #fff;
	}
	
	.title{
		font-size: 50px;
		text-align: center;
		margin-bottom: 74px;
		}
	.title2{
		font-size: 20px;
		text-align: center;
		margin-bottom: 20px;

		
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


/* 회원가입 폼 시작 */

window.onload = function () {	  
	
 		/*이메일 중복확인 시작*/
		 var DupCheck = document.getElementById('DupCheck');
		 DupCheck.onclick = function() {		 
			   var email = document.getElementsByName('email')[0].value;		    
			   var loc = 'http://localhost:9090/emailcheck?email=' + email;
			  
			   var xhr = new XMLHttpRequest();
			   xhr.onreadystatechange = function() {
				   if(xhr.readyState == 4){
					   if(xhr.status == 200) {
						   var data = xhr.responseText;
						   var result = document.getElementById('result');
						   result.innerHTML = data;
						   
					   }
				   }
				   
				   
			   }
			   xhr.open('GET', loc, true);
			   xhr.send();
		 } // DupCheck.onclick 
	var form  = document.getElementById('form1');
	form.onsubmit = function () {
		
			   
		
	   var name  = document.getElementById('name');
	   var passs = document.querySelectorAll('[type=password]');		   
	   var pass1 = passs[0].value;
	   var pass2 = passs[1].value;
	   var term  = document.getElementById('terms');
	   var email = document.getElementById('email');
	   var regExp = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
	   
	   if( pass1 == "" ) {
	        var span_pass1 = document.getElementById('span_pass1');
			span_pass1.innerHTML = 'enter the password';
			return false;  
			}
	   if( pass2 == "" ) {
	        var span_pass2 = document.getElementById('span_pass2');
			span_pass2.innerHTML = 'enter the password again';
			return false;  
			}
	   if( pass1 != pass2 ){
			alert('Your passwords do not match!')
			return false; 
			}
		if(!(term.checked)){
			alert('You must accept the terms and conditions!')
			return false;
			}
			
	   
	   if( ! regExp.test(email.value) ){
			span_email.innerHTML = 'You email address is not valid';
			return false;
	   }
	   
	  return true; // 전송 X
	
	}//form.onsubmit 
	
	
} //window.onload 

function termsAndcons(){
	var x = document.getElementById('termsDiv');
	if (x.style.display == 'none') {
		x.style.display = 'block';
		} else {
		x.style.display = 'none';
		}
}
/* 회원가입 폼 끝 */

      $(document).ready(function(){
        
            
      });
</script>    
	
</head>

<body>
  <!--헤더페이지-->
	<jsp:include page="header.jsp" flush="false"/>
	
	<div id="bodys">
		<div class="member">
		<p class="title">회원가입</p><br>
		
		<p class="title2">※기본정보를 입력해주세요 </p>
		<form action="JoinPro2.jsp" id="form1" method="post" name="myform">
			<!-- 이름 -->
			<input type="text" name="name" id="name"  placeholder="이름"/>
			<!-- 이메일 -->
			<input type="text" name="email" id="email"  placeholder="이메일"/>
			<input type="button" value="중복확인" id="DupCheck" class="login_btn"/>
			
			<span id="result"></span>
			<span id="span_email"></span><br><br>
		
			<input type="password" name="pass1" id="pass"  placeholder="비밀번호"/>
		<span id="span_pass1"></span>
			
			<input type="password" name="pass2" id="pass-check" placeholder="비밀번호 확인"/>
		<span id="span_pass2"></span>
		
		<label for="ages"> 나이 </label>
	
		<select name="ages" id="ages">
			<option value="choose">선택</option>
			<option value="0~19">0~19</option>
			<option value="20~29">20~29</option>
			<option value="30~39">30~39</option>
			<option value="40~49">40~49</option>
			<option value="other">other</option>
		</select><br>

	
	
	<br>
	<p class="title2"> ※ 프로필 정보를 입력해주세요 </p>
	<input type="text" id="bio" name="bio" placeholder="Biography"/><br>
	<label for="job"> Job Role </label>
	<select id="job" name="user_job">
            <option value="choose">choose</option>
          <optgroup label="Web">
            <option value="frontend_developer">Front-End Developer</option>
            <option value="php_developor">PHP Developer</option>
            <option value="python_developer">Python Developer</option>
            <option value="rails_developer"> Rails Developer</option>
            <option value="web_designer">Web Designer</option>
            <option value="WordPress_developer">WordPress Developer</option>
          </optgroup>
          <optgroup label="Mobile">
            <option value="Android_developer">Androild Developer</option>
            <option value="iOS_developer">iOS Developer</option>
            <option value="mobile_designer">Mobile Designer</option>
          </optgroup>
          <optgroup label="Business">
            <option value="business_owner">Business Owner</option>
            <option value="freelancer">Freelancer</option>
          </optgroup>
          <optgroup label="Other">
            <option value="secretary">Secretary</option>
            <option value="maintenance">Maintenance</option>
          </optgroup>
        </select><br>
	
	
	<label for="interests">Interests</label><br>
        <input type="checkbox" id="development" value="interest_development" name="user_interest">
		<label class="light" for="development">Reading</label><br>
        <input type="checkbox" id="design" value="interest_design" name="user_interest">
		<label class="light" for="design">Traveling</label><br>
        <input type="checkbox" id="business" value="interest_business" name="user_interest">
		<label class="light" for="business">Camping</label>
	<br>
	
	
	<button onclick="termsAndcons()"> Terms and conditions </button><br>
	<div style="display:none;" id="termsDiv">
	We may terminate or suspend Your access immediately, <br>
	without prior notice or liability, for any reason whatsoever, <br>
	including without limitation if You breach these Terms and Conditions.<br>
	Upon termination, Your right to use the Service will cease immediately.<br>
	<input type="checkbox" id="terms" name="terms">
	<label class="terms" for="terms"><strong>I accept this</strong></label><br>
	<span id="tandc"></span><br><br>
	</div><br>

	<input type="submit" value="회원가입" class="login_btn"/> 
	<!-- <button class="button" class="login_btn2"> 회원가입 </button> -->
	
		</form>
	


	</div>
	</div>
	<!--푸터 페이지-->
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
