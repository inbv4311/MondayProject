<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(function() {

	});
</script>
</head>
<body>
	<form action="/subpage?cmd=WRITE" method="POST">
	<input type="hidden" name="menu_id" value="HTML" />
	<input type="hidden" name="bnum" value="${htmlVo.bnum}" />
	<input type="hidden" name="lvl" value="${htmlVo.lvl }" />
	<input type="hidden" name="step" value="${htmlVo.step }" />
	<input type="hidden" name="nref" value="${htmlVo.nref }" />
	
	<table>
		<caption><h2> HTML 글쓰기 </h2></caption>
			<tr>
				<td class="td1">작성자</td>
				<td class="td2"><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td class="td1">글제목</td>
				<td class="td2"><input type="text" name="title" /></td>
			</tr>
			<tr>
				<td class="td1">글내용</td>
				<td class="td2"><input type="text" name="cont" /></td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
				<input type="submit" value="확인" /></td>
			</tr>
	
	</table>
	
	
	</form>
</body>
</html>