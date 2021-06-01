<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link href="../css/header.css"rel="stylesheet"/> -->
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
			width: 300px;
			height: 40px;
			float:right;
			color: #000;
		}
			#top_header>ul>li{
				width: 100px;
				height: 40px;
				line-height: 40px;
				float: left;
				font-size: 12px;
				}
	
	header{
		width: 100%;
		height: 120px;
		background: #fff;
		border-top: 1px solid #d7d7d7;
		border-bottom: 1px solid #d7d7d7;
		
	
	}	
		header>ul{
			margin-left: 58px;
			width: 564px;
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
			
			header>ul>li:nth-child(1){
				line-height: 100px;
				margin-right: 64px;
			}
			header>ul>li:nth-child(1)>img{
				width: 119px;
				height: 32px;
				line-height: 32px;
			}
</style>
<title>로그인</title>
</head>
<body>
	<header>
		<div id="top_header">
			<ul>
				<li><a href="${contextPath}/loginForm.jsp">로그인</a></li>
				<li><a href="${contextPath}/joinForm.jsp">회원가입</a></li>
				
			</ul>
		</div>
		<ul>
			<li><a href="${contextPath}/mainpage.jsp"><img src="../img/monday_logo.png" /></a></li>
			<li><a href="/mboard?cmd=LIST&menu_id=MENU01">웹개발</a></li>
			<li>웹퍼블리셔</li>
			<li>웹디자인</li>
			<li>포트폴리오</li>
		</ul>
	</header>
</body>
</html>