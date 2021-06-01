<%@page import="notice.vo.NoticeVO"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("utf-8");
%>
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("adminId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지리스트</title>
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
</style>
</head>

<body>
<jsp:include page="admin_header.jsp"></jsp:include>
<div id="admin_body">
	<h2>공지관리</h2>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>조회수</th>
			<th>날짜</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<c:choose>
			<c:when test="${noticeList == null }">
				<tr>
					<td colspan="7">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${noticeList != null }">
				<c:forEach var="list" items="${noticeList}">
					<tr>
						<td>${list.noticenum}</td>
						<td>${list.adminid}</td>
						<td>${list.noticetitle}</td>
						<td>${list.noticecontent}</td>
						<td>${list.subdate}</td>
						<td><a href="${contextPath}/notice/moditifyform.jsp?noticenum=${list.noticenum}">공지수정</a></td>
						<td><a href="${contextPath}/notice/delnotice.jsp?noticenum=${list.noticenum}">공지삭제</a></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>	
		<tr>
			<td colspan="7"><input type="button" value="글쓰기" onclick="location.href='writeform.jsp'"/></td>
		</tr>	
	</table>
</div>
</body>
</html>
<%}%>