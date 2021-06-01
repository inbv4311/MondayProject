<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.dao.EventDAO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="event.vo.EventVO"%>
<%@ page import="java.util.List"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("adminId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<%
 	  //리스트 목록 출력
 	  request.setCharacterEncoding("utf-8");
      List<EventVO> eventlist = new ArrayList<EventVO>();
	  EventDAO dao = new EventDAO();
      eventlist = dao.seleteventlist();
      
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/materia/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<title>슬라이드 이미지</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<!-- 그리드 형식 나타낼 버튼 -->
    <div class="container" style="margin:150px auto">
      <h1>이미지 슬라이드 추가</h1>
     
      <div class="container text-right mt-3">
        <a type="button" class="no-outline p-0 grid-3x3" title="Spaced">
          <span class="material-icons">
            apps
          </span>
        </a>

        <a
          type="button"
          class="no-outline p-0 mx-2 grid-4x3"
          title="Compact"
        >
          <span class="material-icons">
            view_comfy
          </span>
        </a>
      </div>
      
      <div class="row">
      <!-- 한칸 그리드 -->
      
      <c:choose>
	      <c:when test="${eventlist == null}">
	      		<div>등록된 게시물이 없습니다.</div>
	      </c:when>
      
      <c:when test="${eventlist != null}">
	      <c:forEach var="list" items="${eventlist}">
	        <div class="gv-card col-4 my-4">
	          <div class="card">
	            <img
	              class="card-img-top project-image"
	              src="${contextPath}/upload/${list.eventimg1}"
	              alt="Some alternate text"
	            />
	            <div class="card-body">
	              <h3 class="card-title">[이벤트] ${list.eventtitle}</h3>
	              <p class="card-text">기간 : ${list.eventday}</p>
	              <a href="${contextPath}/vieweventpage?eventnum=${list.eventnum}" class="btn btn-primary">보러가기</a>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
        </c:when>
        </c:choose>
      </div>
      <!-- 여기까지 -->
    </div>
    <!--Scripts needed to run bootstrap-->
    <!-- <script
      src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
      integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
      crossorigin="anonymous"
    ></script> -->
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
   <!--  <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
      integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
      crossorigin="anonymous"
    ></script> -->
    <!--Grid View JS-->
    <script src="main/grid-view.js"></script>
    <script type="text/javascript">

	  var _gaq = _gaq || [];
	  _gaq.push(['_setAccount', 'UA-36251023-1']);
	  _gaq.push(['_setDomainName', 'jqueryscript.net']);
	  _gaq.push(['_trackPageview']);
	
	  (function() {
	    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
	    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
	  })();

</script>
<script>
	try {
	  fetch(new Request("https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js", 
			  { method: 'HEAD', mode: 'no-cors' })).then(function(response) {
	    return true;
		}).catch(function(e) {
	    var carbonScript = document.createElement("script");
	    carbonScript.src = "//cdn.carbonads.com/carbon.js?serve=CK7DKKQU&placement=wwwjqueryscriptnet";
	    carbonScript.id = "_carbonads_js";
	    document.getElementById("carbon-block").appendChild(carbonScript);
	  });
	} catch (error) {
	  console.log(error);
	}
	</script>
  
</body>
</html>
<%}%>