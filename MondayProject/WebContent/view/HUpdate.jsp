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
	<form action="/subpage?cmd=UPDATE" method="POST">
		<input type="hidden" name="menu_id" value="HTML"/>
		<input type="hidden" name="idx" value="${htmlVo.idx }" />
		
		<table>
			<caption><h2> HTML 글 수정하기 </h2></caption>
			<tr>
				<td class="td1"> 글번호 </td>
				<td class="td2">
					<input type="text" value="${htmlVo.bnum }" readonly />
				</td>
			</tr>
			<tr>
				<td class="td1"> 작성자 </td>
				<td class="td2">
					${htmlVo.writer }
				</td>
			</tr>
			<tr>
				<td class="td1"> 글제목 </td>
				<td class="td2">
					<input type="text" name="title" value="${htmlVo.title }" />
				</td>
			</tr>
			<tr>
				<td class="td1"> 글내용 </td>
				<td class="td2">
					<textarea name="cont"> ${htmlVo.cont }</textarea>	
				</td>
			</tr>
			<tr>
				<td class="td1"> 작성일 </td>
				<td class="td2">
					${htmlVo.regdate }
				</td>
			</tr>
			<tr>
				<td class="td1"> 조회수 </td>
				<td class="td2">
					${htmlVo.readcount }
				</td>
			</tr>
			<tr>
				<td colspan="2" class="td3">
					<input type="submit" value="확인" />
				</td>
			</tr>
			
		
		</table>
	
	
	</form>

</body>
</html>