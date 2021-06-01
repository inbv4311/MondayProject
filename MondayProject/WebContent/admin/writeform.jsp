<%@page import="notice.vo.NoticeVO"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="${contextPath}" value="${pageContext.request.contextPath }"/>
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("adminId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<title>공지 관리 글쓰기</title>
<style>
	#admin_body{
		position:absolute;
		width:75%;
		margin-left:5%;
		margin-right:5%;
		height:800px;
		background:#fff;
		float: left;
		top:150px;
		left: 250px;
	}
	#admin_body>h2{
	margin-bottom:50px;
	}
	.table {
      border-collapse: collapse;
      border-top: 3px solid #383838;
      width:100%;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      color: #383838;
      background: #fff;
      text-align: center;
      font-size: 12px;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
      font-size: 10px;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:first-child, .table td:nth-of-type(3) {
      text-align:left;
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    
    /* input type */
   
	
	.table input[type="text"],
	.table textarea[type="text"],
	.table input[type="password"]
	
	 {
	  width: 100%;  /* 원하는 너비 설정 */ 
	  height: auto;  /* 높이값 초기화 */
	  line-height : normal;  /* line-height 초기화 */
	  padding: .8em .5em; /* 원하는 여백 설정, 상하단 여백으로 높이를 조절 */
	  border: 1px solid #999;
	  border-radius: 0;  /* iSO 둥근모서리 제거 */
	  outline-style: none;  /* 포커스시 발생하는 효과 제거를 원한다면 */
	  -webkit-appearance: none;  /* 브라우저별 기본 스타일링 제거 */
	  -moz-appearance: none;
	  appearance: none;
	}
	    
    .table textarea[type="text"]{
    	height: 500px;
    
    }
</style>



</head>
<body>
	<jsp:include page="admin_header.jsp"></jsp:include>
	
	<div id="admin_body">
	<h2>공지 등록</h2>
	<form  method="post" action="writePro.jsp" name="noticeinput" onSubmit="return checkIt()" enctype="application/x-www-form-urlencoded">
	<table class="table">
		<tr>
			<th>작성자아이디</th>
			<td>
				<input type="text" 	  value="빈스디자인" placeholder="아이디" id="adminid" name ="adminid" size="10" maxlength="12" >
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" placeholder="제목"	name ="noticetitle" size="15" maxlength=300"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea type="text" placeholder="내용" 	name ="noticecontent" size="15" maxlength="4000"></textarea></td>
		</tr>
		<tr>

		<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기"/>
			</td>
		</tr>	
	</table>
	</form>
	</div>
</body>
</html>
<%}%>