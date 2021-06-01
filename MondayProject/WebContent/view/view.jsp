<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<style>
   .td1 { width:100px; text-align:center;  }
   .td2 { width:600px; text-align:left; padding:10px;  }
   .td3 { width:700px; text-align:center;  }
   .td22 { width:700px; text-align:center; height:300px;  }
   
   [name=writer] { width:670px;  }
   [name=title]  { width:670px;  }
   [name=cont]   { width:670px; height:300px;  }
</style>
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

   <!--  IDX, TITLE, CONT, WRITER, REGDATE, READCOUNT,
                BNUM, LVL, STEP, NREF, MENU_ID -->

   <table>
    <caption><h2>내용보기</h2></caption>
    <tr>
      <td class="td1">글번호</td>
      <td class="td2">${ boardVo.idx }</td>
    </tr>
    <tr>
      <td class="td1">메뉴번호</td>
      <td class="td2">${ boardVo.menu_id }</td>
    </tr>
    <tr>
      <td class="td1">작성자</td>
      <td class="td2">${ boardVo.writer }</td>
    </tr>
    <tr>
      <td class="td1">작성일</td>
      <td class="td2">${ boardVo.regdate }</td>
    </tr>
    <tr>
      <td class="td1">조회수</td>
      <td class="td2">${ boardVo.readcount }</td>
    </tr>
    <tr>
      <td class="td1">글제목</td>
      <td class="td2">${ boardVo.title }</td>2
    </tr>
    <tr>
      <td class="td1">글내용</td>
      <td class="td22">${ boardVo.cont }</td>
    </tr>
    <tr>
      <td colspan="2" class="td3">
        <a href="/mboard?cmd=WRITEFORM&menu_id=${boardVo.menu_id}&bnum=0&lvl=0&step=0&nref=0">새글쓰기</a>
        <a href="/mboard?cmd=WRITEFORM&menu_id=${boardVo.menu_id}&bnum=${boardVo.bnum}&lvl=${boardVo.lvl}&step=${boardVo.step}&nref=${boardVo.nref}">답글달기</a>
        <a href="/mboard?cmd=UPDATEFORM&menu_id=${boardVo.menu_id}&idx=${boardVo.idx}">수정하기</a>        
        <a href="">삭제하기</a>
        <a href="/mboard?cmd=LIST&menu_id=${boardVo.menu_id}">목록으로</a>
      </td>
    </tr>     
   </table>
   </form> 
</body>
</html>



















