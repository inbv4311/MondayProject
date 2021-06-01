<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.vo.MemberVo"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>회원관리</title>
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
	<!-- 헤더 -->
	<jsp:include page="admin_header.jsp"></jsp:include>
	
	<!-- 바디 -->
	<div id="admin_body">
	<h2>회원목록</h2>
    <input type="button" value="이벤트 등록" onclick="location.href='eventform.jsp'"/>
    
    <table class="table">
		<tr>
			<th>이름</th>
			<th>이메일</th>
			<th>비밀번호</th>
			<th>나이</th>
			<th>bio</th>
			<th>직업</th>
			<th>inter</th>
			<th>탈퇴</th>
		</tr>
		
		<c:choose>
			<c:when test="${memberList == null}">
				<tr>
				<td colspan="6">등록된 회원이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${memberList != null}">
				<c:forEach var="list" items="${memberList}">
					<tr>
						<td>${list.name}"</td>
						<td>${list.email}</td>
						<td>${list.password}</td>
						<td>${list.age}</td>
						<td>${list.bio}</td>
						<td>${list.job}</td>
						<td>${list.inter}</td>
						<td><a href="delmember.jsp?email=${list.email}">회원삭제</a></td>
					</tr>
				</c:forEach>			
			</c:when>
		</c:choose>
		<tr>
			<td colspan="8"><input type="button" value="회원 등록" onclick="location.href='memberform.jsp'"/></td>
		</tr>
		
	</table>
	
    </div>

</body>
</html>
<%}%>