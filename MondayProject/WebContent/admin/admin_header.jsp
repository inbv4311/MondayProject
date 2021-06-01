<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("adminId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*,ul,li,a{
		list-style: none;
		text-decoration: none;
		margin:0;
		padding: 0;
	}
	#header_all_box{
	width: 100%;
	height: 100vh;
	background: #fff;
	}
	#header{
	
		width: 15%;
		height: 100vh;
		background: #f5f5f5;
		float: left;
	}
	#header >ul{
	width: 100%;
	height: 700px;
	background: #f5f5f5;
	top:0;
	left: 0;
	}
	
	#header >ul > li{
	width: 90%;
	height: 100px;
	padding-left:10%;
	line-height:100px;
	text-align:left;
	background: #f5f5f5;
	border-bottom:1px solid #e6e3e3;
	top:0;
	left: 0;
	color:#383838;
	font-size: 14px;
	}
	
	
	
	#header >ul > li >a{
	color:#383838;
	}
	#header >ul > li >a:hover{
	font-weight:900;
	color:#4a90e2;
	}
	
	/* 탑헤더 */

	#top_header{
		width: 100%;
		height: 80px;
		background:#383838;
		top:0;
		left: 0;
		float: left;
		
	}


	#top_header>ul{
		width: 650px;
		height: 80px;
		float: right;
	}

	#top_header>ul > li{
		width: 150px;
		height: 80px;
		line-height:80px;
		text-align:center;
		font-size:12px;
		float: left;
		color:#fff;
	}
	
	#top_header>ul > li > a{
		color:#fff;
	}
	#top_header>ul > li{
		width: 150px;
		height: 80px;
		line-height:80px;
		text-align:center;
		font-size:12px;
		float: left;
		color:#fff;
	}

	
	#top_header>ul > li:nth-child(1)>a{
		text-align:center;
		font-size:15px;
		font-weight:900px;
		float: center;
		color: #4a90e2;
	}
	
	#top_header>ul > li:nth-child(2){
		width: 200px;
		height: 80px;
		line-height:80px;
		text-align:center;
		font-size:12px;
		float: left;
	}

	#top_header> ul > li>a{
		font-size:12px;
	}
</style>

<script>
	function logout(){
		alert('관리자님 로그아웃 되었습니다.');
	}
</script>
<script>
	function modify(){
		alert('회원정보를 수정합니다.');
	}
</script>

</head>
<body>
	<div id="header_all_box">
	<div id="top_header">
		<ul>
			<li><a href="${contextPath}/admin/adminmainpage.jsp"><b>MONDAY</b></a></li>
			<li><b><%=session.getAttribute("adminId")%></b> 환영합니다.</li>
			<li><a href="logout.jsp"  onclick="logout();">로그아웃</a></li>
			<li>홈페이지 이동</li>
		</ul>
	</div>
	<div id="header">
		<ul>
			<li><a href="${contextPath}/admin/memberlistPro.jsp">회원관리</a></li>
			<li><a href="${contextPath}/admin/eventlistPro.jsp">이벤트관리</a></li>
			<li><a href="${contextPath}/admin/noticelistPro.jsp">공지관리</a></li>
		</ul>
	</div>
	</div>
</body>
</html>
<%}%>