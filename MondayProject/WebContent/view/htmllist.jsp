<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HTML page</title>
<style>
	#bodys{
		width: 100%;
		background: #fff;
	}
	#tb_body{
		margin: 0 auto;
		width: 1200px;
	}
</style>
<link rel="stylesheet" href="css/main_v2.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
/* function display(data){
	   var idx			= data.getElementsByTagName('idx');
	   var writer		= data.getElementsByTagName('writer');
	   var title		= data.getElementsByTagName('title');
	   var cont			= data.getElementsByTagName('cont');
	   var regdate		= data.getElementsByTagName('regdate');
	   var readcount	= data.getElementsByTagName('readcount');
	   
	   var tag 			= '';
	   for (var i = 0; i < true ; i++) {
			tag += '<div>';
			tag += '<h2>' + idx[i].innerHTML + '</h2>';
			tag += '<h2>' + writer[i].innerHTML + '</h2>';
			tag += '<h2>' + title[i].innerHTML + '</h2>';
			tag += '<h2>' + cont[i].innerHTML + '</h2>';
			tag += '<h2>' + regdate[i].innerHTML + '</h2>';
			tag += '<h2>' + readcount[i].innerHTML + '</h2>';
			tag += '</div>'; 
			
	}
	   alert(tag);
	   var div1 = document.getElementById('div1');
	   div1.innerHTML = tag;
		
	} */
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
							<li class=""><a href="subpage.html">HTML</a></li>
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
		<caption>
			<tr>
				<td>번호</td>
				<td>유저이름</td>
				<td>제목</td>
	
				<td>날짜</td>
				<td>조회수</td>
				
			</tr>
			
			<!-- http://localhost:9090/subpage?cmd=javaview -->
			<c:forEach var="html" items="${requestScope.htmlList}">
			<tr>
				<td>
					<c:choose>
						<c:when test="${html.lvl == 0 }"> ${html.bnum}
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</td>
				<td class="left" style="padding-left:${html.lvl * 30 + 10}px">
					<c:choose>
						<c:when test="${html.lvl eq 0 }">
							<a href="/subpage?cmd=htmlView&idx=${ html.idx }&menu_id=${html.menu_id}"> ${html.title }</a>
						</c:when>
						<c:otherwise>
							<a href="/subpage?cmd=htmlView&idx=${ html.idx }&menu_id=${html.menu_id}"> [re]${html.title }</a>
						</c:otherwise>
					</c:choose>
				</td>
				<td>${html.regdate }</td>
				<td>${html.readcount }</td>
				
			</tr>
			</c:forEach>
			
		</caption>
	</table>
	
	 검색<input type="text" id="search" />
  <button id="btnGetData">검색</button>
  <div id="div1"></div>
  
	  <div class="btn_wrap">
     <tr>
       <td colspan="5" class="right">
        <a href="/subpage?cmd=WRITEFORM&menu_id=HTML&bnum=0&lvl=0&step=0&nref=0">새글쓰기</a>
       </td>
     </tr>
  </div>
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



















