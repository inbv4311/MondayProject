<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="../css/board.css"rel="stylesheet"/>
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
   
   
   [name=writer] { width:670px;  }
   [name=title]  { width:670px;  }
   [name=cont]   { width:670px; height:300px;  }
   
   
   /* view 게시판 */
   
   table.type05 {
   	  width:1200px;
	  border-collapse: separate;
	  border-spacing: 1px;
	  text-align: left;
	  line-height: 1.5;
	  border-top: 1px solid #ccc;
	  margin: 20px 10px;
	}
	table.type05 th {
	  width: 50px;
	  padding: 10px;
	  font-weight: bold;
	  font-size:12px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	  background: #efefef;
	}
	table.type05 td {
	  width: 350px;
	  padding: 10px;
	  vertical-align: top;
	  border-bottom: 1px solid #ccc;
	}
	
</style>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
   $(function() {

   });
</script>
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
			<c:forEach var="menu" items="${ menuList }">
			<td class ="left_menu_td">
			  <a href="/mboard?cmd=LIST&menu_id=${menu.menu_id}">
			${ menu.menu_name }게시판
			  </a>
			</td>
			</c:forEach>
	     </tr>
   </table>
   
   <br><br>
	
   <!-- 글제목(title), 글내용(content0  -->
   <form action="/mboard?cmd=UPDATE" method="POST">
   <input type="hidden" name="menu_id" value="${menuVo.menu_id}" />   
   <input type="hidden" name="idx" value="${boardVo.idx}" />  
    
   <table  id="board_table" class="type05">
   
    <div id="board_title">
    	<span style="padding-left:50px;"> ${ menuVo.menu_name  } 글수정하기</span>
   	</div>
   	
   	<br>
   	
    <tr>
      <th>글번호</th>
      <td>
         <input type="text" value="${ boardVo.bnum }" readonly />       
      </td>
    </tr>
    <tr>
      <th>작성자</th>
      <td>
         ${ boardVo.writer }
      </td>
    </tr>
    <tr>
      <th>글제목</th>
      <td>
        <input type="text" name="title" value="${ boardVo.title }" />
      </td>
    </tr>
    <tr>
      <th>글내용</th>
      <td>
         <textarea name="cont" >${ boardVo.cont }</textarea>
       </td>
    </tr>
    <tr>
      <th>작성일</th>
      <td>
        ${ boardVo.regdate }
      </td>
    </tr>
    <tr>
      <th>조회수</th>
      <td>
        ${ boardVo.readcount }
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="확인" />
      </td>
    </tr>     
   </table>
   </form> 
   
 	<jsp:include page="../footer.jsp" flush="false"/>
</body>
</html>
<%} %>


















