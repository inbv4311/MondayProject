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
<title>jsp 파일 업로드</title>
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

</head>
<body>
<jsp:include page="admin_header.jsp"></jsp:include>
   	
	<div id="admin_body">
    <h2>이벤트 등록</h2>
   	<form action="uploadAction.jsp" method="post" enctype="multipart/form-data">
    <table class="table">
    	<tr>
    		<th>이벤트 제목</th>
    		<td>
    			<input type="text" id="eventtitle" name="eventtitle" value="제목입니당"/>
    		</td>
    	</tr>
    	<tr>
    		<th>이벤트 기간</th>
    		<td>
    			<input type="text" id="eventday" name="eventday" value="2021-25-21~2515-65.25"/>
    		</td>
    	</tr>

    	<tr>
    		<th>이벤트 내용</th>
    		<td>
    			<input type="text" id="eventcontent" name="eventcontent" value="[이벤트] 내용"/>
    		</td>
    	</tr>
    	<tr>
    		<th>썸네일 파일</th>
    		<td>
    			<input type="file" name="eventimg1" />
    		</td>
    	</tr>
    	<tr>
    		<th>내용 포스터 파일 </th>
    		<td>
    			<input type="file" name="eventimg2" />
    		</td>
    	</tr>
		<tr>
    		<td colspan="2">
		    	<input type="submit" value="업로드">
    		</td>
    	</tr>
    </table>  
    </form>
    </div>
</body>
</html>
<%}%>