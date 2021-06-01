<%@page import="notice.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String noticenum = request.getParameter("noticenum");
	NoticeDAO dao = new NoticeDAO();
	dao.deleteMember(noticenum);
%>
<script>
	alert("삭제되었습니다.");
	location.href="noticelistPro.jsp"
</script>