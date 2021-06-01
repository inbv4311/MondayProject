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
<title>공지 관리 글쓰기</title>
<style>
	

	.table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width:1200px;
      text-align: center;
      margin: 0 auto;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 11px;
      border: 1px solid #ddd;
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
	.table input[type="password"] {
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
	    
</style>

<%
	String noticenum = request.getParameter("noticenum");
	NoticeDAO dao = new NoticeDAO();
	NoticeVO vo = dao.getNotice(noticenum);

%>


</head>
<body>
	<jsp:include page="${contextPath}/view/header.jsp"></jsp:include>
	<form  method="post" action="moditify.jsp" name="noticeinput" onSubmit="return checkIt()" enctype="application/x-www-form-urlencoded">
	<table class="table">
	<h1>공지 등록</h1>
		<tr>
			<th>작성글 번호</th>
			<td>
				<input type="text" 	  value="<%=vo.getNoticenum()%>" placeholder="번호" id="adminid" name ="adminid" size="10" maxlength="12">
			</td>
		</tr>
		<tr>
			<th>작성자아이디</th>
			<td>
				<input type="text" 	 value="<%=vo.getAdminid()%>"  placeholder="아이디" id="adminid" name ="adminid" size="10" maxlength="12">
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text"    value="<%=vo.getNoticetitle()%>"	name ="noticetitle" size="15" maxlength=300"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><input type="text" 	   value="<%=vo.getImagefilename()%>" 	name ="noticecontent" size="15" maxlength="4000"></td>
		</tr>
		
		<tr>
			<th>파일</th>
			<td><input type="file" value="<%=vo.getImagefilename()%>" name ="imagefilename"></td>
		</tr>
		

		<tr>
			<td colspan="2">
				<input type="submit" value="글쓰기"/>
			</td>
		</tr>	
	</table>
	</form>
</body>
</html>
<%}%>