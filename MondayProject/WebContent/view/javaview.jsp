<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<link rel="stylesheet" href="css/main_v2.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {

	});
</script>
</head>
<body>

 <!--헤더페이지-->
  <header id="header">
		<div class="svcWrap">
			<div class="gnbWrap">
				<h1><a href="mainpage.html" class="nateonbi">
					<img src="img/monday_logo.png" width="133" height="26"/></a></h1>
				
			
				
				<!-- //textGNB -->
				
				<nav class="navWrap">
					<div class="snbArea" role="navigation">
						<h2 class="hide">MODAY메뉴</h2>
						<ul>
							<li class="on"><a href="/subpage?cmd=JAVALIST" aria-current="page">JAVA</a></li>
							<li class=""><a href="/subpage?cmd=HTML">HTML</a></li>
							<li class=""><a href="subpage.html">DATABASE</a></li>
							<li class=""><a href="subpage.html">SQL</a></li>
							<li class=""><a href="subpage.html">SPRING</a></li>
						</ul>
					</div>
				</nav>
				
				<div class="outLink">
					<h2 class="hide">바로가기 링크</h2>
					<a href="login.html" target="_blank">Login</a>
					<a href="join.html" target="_blank">Join</a>
					<a href="mypage.html" target="_blank">My page</a>
				</div>
			</div>
		</div>
		<!-- navigation -->
	</header>




	<table>
		<caption><h2> 내용 보기 </h2></caption>
		<tr>
			<th> 번호 </th>
			<td>${javaVo.j_number}</td>
		</tr>
		<tr>
			<th> 제목 </th>
			<td>${javaVo.j_subject}</td>
		</tr>
		<tr id=content>
			<th> 내용 </th>
			<td>${javaVo.j_content}</td>
		</tr>
		<tr>
			<th> 날짜 </th>
			<td>${javaVo.j_regdate}</td>
		</tr>
		<tr>
			<th> 조회수 </th>
			<td>${javaVo.j_readcount}</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<a href="/subpage?cmd=JAVALIST"> 목록으로 </a>
				<a href="/subpage?cmd=UPDATEFORM&idx=${javaVo.j_number}"> 수정 </a>
				<a href="/subpage?cmd=DELETE&idx=${javaVo.j_number}"> 삭제 </a>
				<a href="javascript:history.go(-1)"> 이전으로 </a>
			</td>
		</tr>
	</table>

	
		<div id="footer">
	<footer>
		<div class="footer">
			<div class="ftlink">
				<a href="#" target="_blank" title="서비스 이용약관">서비스약관</a>
				<a href="#" target="_blank" title="개인정보처리방침"><strong>개인정보처리방침</strong></a>
				<a href="#" target="_blank" title="청소년보호정책">청소년보호정책</a>
				<a href="#" title="광고문의">광고문의</a>
				<a href="#" target="_blank" title="고객센터">고객센터</a>
			</div>
			<div class="copyright">Copyright © monday</div>
		</div>
	</footer>
	</div>


</body>
</html>