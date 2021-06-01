<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="board.mboard.dao.JavaDao"%>
<%@page import="board.mboard.vo.JavaVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 페이지</title>
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
	function display(data){
	   var j_number		= data.getElementsByTagName('j_number');
	   var j_username	= data.getElementsByTagName('j_username');
	   var j_subject	= data.getElementsByTagName('j_subject');
	   var j_content	= data.getElementsByTagName('j_content');
	   var j_regdate	= data.getElementsByTagName('j_regdate');
	   var j_readcount	= data.getElementsByTagName('j_readcount');
	   
 	   var tag 			= '';
	   for (var i = 0; i < true ; i++) {
			tag += '<div>';
			tag += '<h2>' + j_number[i].innerHTML + '</h2>';
			tag += '<h2>' + j_username[i].innerHTML + '</h2>';
			tag += '<h2>' + j_subject[i].innerHTML + '</h2>';
			tag += '<h2>' + j_content[i].innerHTML + '</h2>';
			tag += '<h2>' + j_regdate[i].innerHTML + '</h2>';
			tag += '<h2>' + j_readcount[i].innerHTML + '</h2>';
			tag += '</div>'; 
			
	}
	   alert(tag);
	   var div1 = document.getElementById('div1');
	   div1.innerHTML = tag;
		
	}
	
	window.onload = function() {
		var btnGetData = document.getElementById('btnGetData');
		btnGetData.onclick = function(){
			var xhr = new XMLHttpRequest();
			var search = document.getElementById('search').value;
			var loc = 'http://localhost:9090/jsearch?search='+search;
			xhr.onreadystatechange = function(){
				if(xhr.readyState == 4){
					if(xhr.status == 200){
						var data = xhr.responseXML;
						console.dir(data);
						display(data);
					}
				}
			}
			
			xhr.open('GET', loc, true);
			xhr.send();
		}
	
	}
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




<!-- 수빈님꺼 붙이는중 시작 -->

<%-- 
<div id="bodys">
		<div id ="tb_body">
			 <div class="container managergrounp" id="container" name="container" >
            <p style="font-size: 50px; margin: 20px 0px;">JAVA<span style="font-size: 15px; padding-left: 20px;"> (자바에 대해서 배우세요)</span></p>
			<p><button><a href="/WriteFrom.html">글쓰기</a></button></p>
			
            <table class="bbsList">
                
                <thead class="head">
                    <tr>
                        <th><a class="checkbox" href="" ></a></th> 
                        <th>번호</th>
                        <th>과목</th>   
                        <th>제목</th>   
                        <th>등록일</th>
                        <th>수정</th> 
                    </tr>    
                </thead>
                <tbody class="body">
                	  <%
                        if(blist.size() ==0) {
                        %>
                        <tr>
                        	<td colspan="7">
                        		<p>등록된 게시글이 없습니다.</p>
                        	</td>
                        </tr>
                        <%
                        }else{ 
                        	for(int i=0; i < blist.size();i++){
                        		JavaVo vo = (JavaVo)blist.get(i);
                        %>
                    <tr>
                        <td><a class="checkbox_checked" href="javascript:;" >✓</a></td>
                      
                        <td><%=vo.getJ_number()%></td>
                        <td><%=vo.getJ_username() %></td>
                        <td><%=vo.getJ_subject() %></td>
                        <td><%=vo.getJ_regdate() %></td>       
                                                                         
                        <td><a class="viewbtn" href="#" target="_blank"><span class="txt_org">보기</span></a></td>
                    </tr>
                        
                        <%
                        	}
                        		} 
                        %>
                   
                </tbody>
                <tfoot class="foot">
                    <tr>
                        <td colspan="7">
                            <span class="arrow radius-right">≪</span>
                            <span class="arrow radius-left">＜</span>
                            
                            <a href="javascript:;" class="num_box txt_point">1</a>
                            <a href="javascript:;" class="num_box ">2</a>
                            <a href="javascript:;" class="num_box ">3</a>
                            <a href="javascript:;" class="num_box ">4</a>
                            <a href="javascript:;" class="num_box ">5</a>
                            <a href="javascript:;" class="num_box ">6</a>
                            <a href="javascript:;" class="num_box ">7</a>
                            <a href="javascript:;" class="num_box ">8</a>
                            <a href="javascript:;" class="num_box ">9</a>
                            <a href="javascript:;" class="num_box ">10</a>

                            <span class="arrow radius-right">＞</span>
                            <span class="arrow radius-left">≫</span>
                        </td>
                    </tr>    
                </tfoot>
            </table>
            <div class="btn_wrap">
                <a class="btn_org" href="WriteFrom.html"><span class="txt_white">글쓰기</span></a>
            </div>
        </div>
       
		</div>
	</div>
 --%>

<!-- 수빈님꺼 붙이는중 끝 -->




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
			<c:forEach var="java" items="${requestScope.javaList}">
			<tr>
				<td>${java.j_number}</td>
				<td>${java.j_username}</td>
				<td><a href="/subpage?cmd=JavaView&j_number=${java.j_number}">${java.j_subject}</a></td>

				<td>${java.j_regdate}</td>
				<td>${java.j_readcount}</td>
			</tr>
			</c:forEach>
			
		</caption>
	</table>
	
	 검색<input type="text" id="search" />
  <button id="btnGetData">검색</button>
  <div id="div1"></div>
  <div class="btn_wrap">
  <a class="btn_org" href="/board/WriteForm.html"><span class="txt_white">글쓰기</span></a>
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