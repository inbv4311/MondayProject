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
<style type="text/css">
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
			width: 500px;
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
			width: 250px;
			overflow:hidden;
			line-height: 40px;
			float: left;
			font-size: 12px;
			text-align: center;
		}
		#top_header>ul>li:nth-child(2){
			width: 150px;
			line-height: 40px;
			float: left;
			font-size: 12px;
			text-align: center;
		}
		
		
	header{
		width: 100%;
		height: 80px;
		background: #fff;
		border-top: 1px solid #d7d7d7;
		border-bottom: 1px solid #d7d7d7;
	
	}	
		header>ul{
			margin-left: 58px;
			width: 100%;
			height: 80px;
			float:left;
			color: #000;
		}
			header>ul>li{
				width: 100px;
				text-align: center;
				height: 80px;
				line-height: 80px;
				float: left;
				font-size: 15px;
				}
			header>ul>li:nth-child(1) {
				width:264px;	
				line-height:100px;
		}

</style>

<title>로그인</title>
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
    
		<div id="top_header">
			<ul>
				<li><b><%=session.getAttribute("adminId")%></b>님 이 로그인 되었습니다 :)</li>
				<li>현재 서버인원수 :<span style="color:red;"><b>25</b></span></li>
				<li><a href="logout.jsp"  onclick="logout();">로그아웃</a></li>
				
			</ul>
		</div>
    
	<header>
		<ul>
			<li><a href="${contextPath}/admin/adminmainpage.jsp"><img src="../img/monday_logo.png" /></a></li>
			<li><a href="${contextPath}/admin/memberlistPro.jsp">회원관리</a></li>
			<li><a href="${contextPath}/admin/eventlistPro.jsp">이벤트관리</a></li>
			<li><a href="${contextPath}/admin/noticelistPro.jsp">공지관리</a></li>
			<li>포트폴리오</li>
		</ul>
	
	</header>
</body>
</html>

<%}%>