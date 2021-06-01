<%@ page  contentType="text/html; charset=UTF-8"%>
<% 
   if(session.getAttribute("memId") == null){%>
	<jsp:forward page="loginForm.jsp" />
     <%}else{%> 
	<jsp:forward page="login.jsp" />
 <%} %>
 
 
 