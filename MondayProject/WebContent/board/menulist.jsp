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
<style>

</style>
</head>
<body>
   <table>
    <tr>
      <td colspan="5" class="right">
       <a href="mboard?cmd=MENUWRITEFORM"> 메뉴추가</a>
      </td>
    </tr>
    <tr>
      <td>메뉴아이디</td>
      <td>메뉴이름</td>
      <td>순번</td>
      <td>수정</td>
      <td>삭제</td>
    </tr>
    
    <c:forEach var="menu" items="${ requestScope.menuList  }">
    <tr>
      <td>${menu.menu_id}</td>
      <td>${menu.menu_name }</td>
      <td>${menu.menu_seq }</td>
      <td><a href="/mboard?cmd=MENUUPDATEFORM&menu_id=${menu.menu_id}">수정</a></td>
      <td><a href="/mboard?cmd=MENUDELETE&menu_id=${menu.menu_id}">삭제</a></td>      
    </tr>
    </c:forEach>
    
   </table>
</body>
</html>
<%} %>


















