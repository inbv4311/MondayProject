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
<link href="../css/header.css"rel="stylesheet"/>
<link href="./css/footer.css"rel="stylesheet"/>
<title>리스트</title>
<!-- <link rel="stylesheet" href="/css/common.css" /> -->
<style></style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
<style>
	#left_menu{
		width:200px;
		height:500px;
		float: left;
		background: #fff;
		border: 0px;	
		border-right: 1px solid #efefef;
		border-bottom: 1px solid #efefef;
	}
	
	#left_menu_tr{
		width:200px;
		float: left;
		border-left:0px;
		border-right: 0px;
		border-top:0px;
	}

	.left_menu_td{
		border: 0px;
		width:200px;
		height:40px;
		line-height:50px;
		text-align:left;
		float: left;
		color:#8a8784;
		font-size:12px;
		padding-left:50px;
	}
	.header_title{
		width:100%;
		height: 50px;
		
		color:#878787;
		line-height:50px;
		font-size:12px;
		border-bottom: 1px solid #efefef;
	}
	
	
	#board_title{
		width:100%;
		border-bottom: 1px solid #efefef;
		height: 80px;
		line-height:80px;
		font-size:30px;
		color:#878787; 
		
	}
	
	/* 테이블 */
	table.type09 {
	  width:1000px;
	  margin-left:250px;
	  border-collapse: collapse;
	  text-align: left;
	  line-height: 1.5;

	}
	
	table.type09 tbody th {
	  font-size:13px;
	  width: 150px;
	  padding: 10px;
	  font-weight: bold;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #f3f6f7;
	}
	table.type09 td {
	  font-size:13px;
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	
	/* 글쓰기버튼  */
	
	#new_click_box{
		margin-left:250px;
		width:1000px;
		height: 200px;
		/* background: pink; */
	}
	
	
	.color-bg-start {
	  background-color: salmon;
	}
	
	
	/* toggle class bg-animate-color */
	
	.bg-animate-color {
	  animation: random-bg .5s linear infinite;
	}
	
	
	/* add animation to bg color  */
	
	@keyframes random-bg {
	  from {
	    filter: hue-rotate(0);
	  }
	  to {
	    filter: hue-rotate(360deg);
	  }
	}
	
	.fun-btn {
	  /* change bg color to get different hues    */
	  background-color: salmon;
	  margin-top:50px;
	  position:relative;
	  float:right;
	  text-align:center;
	  color: white;
	  padding: 2em 3em;
	  border: none;
	  transition: all .3s ease;
	  border-radius: 5px;
	  letter-spacing: 2px;
	  text-transform: uppercase;
	  outline: none;
	  align-self: center;
	  cursor: pointer;
	  font-weight: bold;
	}
	
	.fun-btn:hover {
	  animation: random-bg .5s linear infinite, grow 1300ms ease infinite;
	}
	
	.start-fun {
	  background-color: #fff !important;
	  /* change color of button text when fun is started   */
	  color: salmon !important;
	}
	
	/* pulsating effect on button */
	@keyframes grow {
	  0% {
	    transform: scale(1);
	  }
	  14% {
	    transform: scale(1.3);
	  }
	  28% {
	    transform: scale(1);
	  }
	  42% {
	    transform: scale(1.3);
	  }
	  70% {
	    transform: scale(1);
	  }
}
</style>
</head>
<body>
  
   	<!-- 헤더  시작 -->
    <!--헤더페이지-->
  	<jsp:include page="../header.jsp" flush="false"/>
   	<!-- 헤더 끝     -->
  <div class="header_title" >
  	<span style="padding-left:50px;">웹개발  > 클릭된메뉴</span>
  	</div>
  	
   <table id="left_menu">
		<tr id="left_menu_tr">
		 <c:forEach  var="menu"  items="${ requestScope.menuList }">
		  <td class ="left_menu_td">
		    <a href="/mboard?cmd=LIST&menu_id=${menu.menu_id}">${menu.menu_name}에 대해서</a>
		  </td>     
		 </c:forEach>     
		</tr>
   </table> 
   
  <!-- 게시판 시작 -->
  
    <div id="board_title">
    	<span style="padding-left:50px;"> ${ menuVo.menu_name  } 게시판</span>
   	</div>
    <br>
   <!-- 게시판 바디 -->
   <table class="type09">
     <tr>
       <th>번호</th>
       <th>제목</th>
       <th>작성자</th>
       <th>작성일</th>
       <th>조회수</th>
     </tr>
     

     <c:forEach var="board" items="${ requestScope.boardList }">
     <tr>
       <td>    
         <c:choose> 
          <c:when test="${board.lvl == 0 }">        
             ${ board.bnum }
          </c:when> 
          <c:otherwise>             
          </c:otherwise>
         </c:choose>  
       </td>
       
       <td class="left" style="padding-left:${board.lvl * 30 + 10}px">
         <c:choose>
           <c:when test="${board.lvl eq 0}" >  
               <a href="/mboard?cmd=VIEW&idx=${ board.idx }&menu_id=${menuVo.menu_id}">
               ${ board.title }
               </a>
           </c:when>
           <c:otherwise>
               <a href="/mboard?cmd=VIEW&idx=${ board.idx }&menu_id=${menuVo.menu_id}">
               [re] ${ board.title }
               </a>
           </c:otherwise>    
         </c:choose>
       </td>     
         
       <td>${ board.writer }</td>       
       <td>${ board.regdate }</td>       
       <td>${ board.readcount }</td>  
            
     </tr>
     </c:forEach>
   </table>
   <div id="new_click_box">
        <input type="button" value="글쓰기" class="fun-btn" 
        onclick="location.href='/mboard?cmd=WRITEFORM&menu_id=${menuVo.menu_id}&bnum=0&lvl=0&step=0&nref=0'">
   	</div>
   	<!-- 푸터 시작   -->
  	<!--헤더페이지-->
  	<jsp:include page="../footer.jsp" flush="false"/>
	<!-- 푸터 끝  -->
</body>
</html><!--헤더페이지-->

<%} %>












