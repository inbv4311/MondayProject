<%@page import="event.dao.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="event.vo.EventVO"%>
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
<head>
    <title>이벤트 리스트</title>
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
	<h2>이벤트목록</h2>
	<a href="${contextPath}/admin/slideimagePro.jsp">회원용 보여주기</a>
    <input type="button" value="이벤트 등록" onclick="location.href='eventform.jsp'"/>
    
    <table class="table">
		<tr>
			<th>번호</th>
			<th>타이틀</th>
			<th>기간</th>
			<th>썸네일</th>
			<th>업로드날짜</th>
			<th>삭제</th>
		</tr>
		
		<c:choose>
			<c:when test="${eventlist == null}">
				<tr>
				<td colspan="6">등록된 글이 없습니다.</td>
				</tr>
			</c:when>
			<c:when test="${eventlist != null}">
				<c:forEach var="list" items="${eventlist}">
					<tr>
						<td><c:out value="${list.eventnum}"/></td>
						<td>[이벤트]<c:out value="${list.eventtitle}"/></td>
						<td> 기간:<c:out value="${list.eventday}"/></td>
						<td><img src ="${contextPath}/upload/${list.eventimg1}" width="100px" height="100px"/></td>
						<td>${list.eventdate}</td>
						<td><a href="delevent.jsp?eventnum=${list.eventnum}">이벤트삭제</a></td>
					</tr>
				</c:forEach>			
			</c:when>
		</c:choose>
		<tr>
			<td colspan="6"><input type="button" value="이벤트 등록" onclick="location.href='eventform.jsp'"/></td>
		</tr>
		
	</table>
	
    </div>
</body>
</html>
<%}%>