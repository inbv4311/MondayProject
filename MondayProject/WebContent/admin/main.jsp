<%@ page  contentType="text/html; charset=UTF-8"%>
<% 
   if(session.getAttribute("adminId") == null){%>
	<jsp:forward page="../loginForm.jsp" />
     <%}else{%> 
	<jsp:forward page="adminmainpage.jsp" />
 <%} %>
 
 