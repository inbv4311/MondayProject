<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("memId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../css/header2.css"rel="stylesheet"/>
<style>
*,ul,li,a{
		padding: 0;
		margin: 0;
		list-style: none;
		font-family: 'NanumGothic';
		list-style: none;
		text-decoration: none;
		
	}
	
	#top_header{
		width: 100%;
		height: 40px;
		background:#fff;
	}
		#top_header>ul{
			width:500px;
			height: 40px;
			float:right;
			color: #000;
			
		}
		#top_header>ul>li{
			width: 100px;
			line-height: 40px;
			float: left;
			font-size: 12px;
			text-align: center;
		}
		#top_header>ul>li:nth-child(1){
			width: 200px;
			line-height: 40px;
			float: left;
			font-size: 12px;
			text-align: center;
		}
		#top_header>ul>li:nth-child(3){
			width: 100px;
			margin-right:100px;
			line-height: 40px;
			float: left;
			font-size: 12px;
			text-align: center;
		}
		
		.topbtn{
		 border: 0px;
		 background: #fff;
		
		}

</style>

<title>로그인</title>
<script>
	function logout(){
		alert('로그아웃 되었니다');
	}
</script>
</head>
<body>
   <form  method="post" action="logout.jsp">  
	<div id="top_header">
		<ul>
			<li><b><%=session.getAttribute("memId")%></b>님 이 로그인 되었습니다.</li>
			<li><input type="submit" value="로그아웃" class="topbtn" onclick="logout();"></li>
			<li><p onclick="location.href='modifyForm.jsp'">마이페이지</p></li>
			<!-- <li><p  class="topbtn"onclick="location.href='deleteForm.jsp'">회원탈퇴</p></li> -->
		</ul>
	</div>
   </form>
	<header>
		<ul>
			<li><a href="${contextPath}/main.jsp"><img src="../img/monday_logo.png" /></a></li>
			<li><a href="/mboard?cmd=LIST&menu_id=MENU01">웹개발</a></li>
			<li>웹퍼블리셔</li>
			<li>웹디자인</li>
			<li>포트폴리오</li>
		</ul>
	
	</header>
</body>
</html>

<%}%>