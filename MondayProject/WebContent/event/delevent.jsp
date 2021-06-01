<%@page import="event.dao.EventDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String eventnum = request.getParameter("eventnum");
	EventDAO dao = new EventDAO();
	dao.deleteEvent(eventnum);
%>
 <script>
	alert("삭제되었습니다.");
	location.href="eventlistPro.jsp"
</script> 