<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("memId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/common.css" />
<style></style>
</head>
<body>
  <form action="/mboard?cmd=MENUWRITE" method="POST">
  <table>
   <caption><h2>메뉴 추가</h2></caption>
   <tr>
     <td colspan="2" class="right">
        <a href="/mboard?cmd=MENULIST">메뉴리스트</a>
     </td>  
   </tr>
   <tr>
     <td>메뉴이름</td>
     <td><input type="text" name="menu_name"/></td>
   </tr>
   <tr>
     <td colspan="2" class="center">
        <input type="submit" value="추가" />
     </td>
   </tr>
  </table> 
  </form>
</body>
</html>
<%} %>













