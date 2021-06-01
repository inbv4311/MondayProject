<%@page import="notice.vo.NoticeVO"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@page import="event.dao.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="event.vo.EventVO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
 	  //리스트 목록 출력
 	  request.setCharacterEncoding("utf-8");
      List<EventVO> eventlist = new ArrayList<EventVO>();
	  EventDAO dao = new EventDAO();
      eventlist = dao.seleteventlist();
	  request.setAttribute("eventlist", eventlist);
%> 

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<link href="../css/header.css"rel="stylesheet"/>
<link href="/css/materialize.min.css"rel="stylesheet"/>
<link href="https://codepen.io/WithAnEs/pen/7534eb3fb62294822de9eace9a699d85"rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.96.1/js/materialize.min.js"></script>
<script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/15979/footer-inject.js"></script>
<!-- 이벤트 슬라이드 -->
<link href="https://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/4.5.0/materia/bootstrap.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
<!-- 공지 -->
<link rel="stylesheet" href="css/import.css">
<script src="js/jquery-1.11.3.min.js"></script>
<script src="js/script.js"></script>
<script src="js/jquery.min.js"></script>
<link href="css/hover.css" rel="stylesheet" media="all">
<link href="css/mainslide.css" rel="stylesheet" media="all">
<link href="css/mainsearch.css" rel="stylesheet" media="all">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
<title>Monday 페이지</title>

<!-- /* 슬라이드 구문 */ -->
<script type="text/javascript">
	
		$(document).ready(function(){
			  $('.slider').slider();
			});
	
	
</script>

<!-- /* 검색창 */ -->
<script type="text/javascript">
	function searchToggle(obj, evt){
    var container = $(obj).closest('.search-wrapper');
        if(!container.hasClass('active')){
            container.addClass('active');
            evt.preventDefault();
        }
        else if(container.hasClass('active') && $(obj).closest('.input-holder').length == 0){
            container.removeClass('active');
            // clear input
            container.find('.search-input').val('');
        }
}
	
</script>

<script>
function myNews(){
	
 	var totalPage = 1;
	
	function display(data, opt){
		switch (opt){
		case 'xml' :
			alert(data);
			
			var html = '';
			$(data).find('item').each(function(index, item){
				var title 		= $(this).find('title').text();
				var link 		= $(this).find('link').text();
				var description = $(this).find('description').text();
				var pubDate 	= $(this).find('pubDate').text();
				
				html += '<div class="box">';
				html += '<h2>';
				html += '<a target="_blank" href="' + link + '">';				
				html += title;				
				html += '</a>';				
				html += '</h2>';
				html += '<p>';
				html += pubDate;
				html += '</p>';
				html += '<p>';
				html += description;
				html += '</p>';
				html += '</div>';
			});
			
			$('#mainnews').html(html);
			break;
		case 'json' :
			var items = data.items;
			//바로 배열이 들어감
			$.each(items, function (){
				var title 		= this.title;
				var link 		= this.link;
				var description = this.description;
				var pubDate 	= this.pubDate;
				
				html += '<div class="box">';
				html += '<h2>';
				html += '<a target="_blank" href="' + link + '">';				
				html += title;				
				html += '</a>';				
				html += '</h2>';
				html += '<p>';
				html += pubDate;
				html += '</p>';
				html += '<p>';
				html += description;
				html += '</p>';
				html += '</div>';
			});
			
			$('#mainnews').html(html);
			break;
		}
	}

 	function display_paging(total, countPerPage){
		var html 		= '';
		var lastPageNo	= 5;
		for (i = 1; i <= lastPageNo; i++) {
			html += '<a href="#" id="btnSearchA">' + i + '</a>';
		}
		$('#paging').html(html);
	}
	
	$(function(){
		$.ajax({
			url		: 'http://localhost:9090/mainnews',
			data	: { keyword : $('#keyword').val(),
				currentPage : $('#currentPage').val()
			},
			success : function(data){
				
				var total 		 = data.total;
				var countPerPage = 5;
				 display_paging(total, countPerPage); 
				display(data, "json");
				
				console.log(data.items);
			},
			error	: function(xhr){
				alert(xhr.status + ', '+xhr.statusText);
			}
			
		});

		$('#paging').on('click', '#btnSearchA', function(e){
			// a tag 기본이벤트를 무시한다 - 페이지 이동 기능을 제거
			e.preventDefault();
			e.stopPropagation();
			
			var currentPage = e.target.innerHTML;
			$.ajax({
				url 	:  'http://localhost:9090/mainnews',
				data 	: {
					keyword 	 : $('#keyword').val(),
					currentPage  : currentPage,
					countPerPage : 5 
				},
				success : function(data){
					var total 		 = data.total;
					var countPerPage = 10;
					display_paging(total, countPerPage);
					display(data, "json");
				},
				error	: function(xhr){
					alert(xhr.status + ', '+ xhr.statusText);
				}
			});
			alert('a click' + e.target.innerHTML); //현재 페이지 찾기
			
		});
		
		var curPage = 1;
		//img tag 이벤트 연결
		$('#paging2 a').on('click', function(e){
			switch(e.target.id){
			case 'imgprev' :
				alert('이전클릭');
				if(curPage >= 2)
					curPage = curPage - 1;
				else
					curPage = 1;
				break;
			case 'imgnext' :
				alert('다음클릭');
				if(curPage < totalPage)
					curPage = curPage + 1;
				else
					curPage = totalPage;
				break;
			}
			$.ajax({
				url		: 'http://localhost:9090/mainnews',
				data	: {
					keyword : $('#keyword').val(),
					currentPage  : curPage,
					countPerPage : 5
				},
				success : function(data){
					var total 		 = data.total;
					var countPerPage = 5;
 					display_paging(total, countPerPage);
					display(data, "json");
				},
				error	: function(xhr){
					alert(xhr.status + ', '+ xhr.statusText);
				}
			});
			
		});
		
	}); //메인 function 
}
</script>    
<!--공지 -->
<style>
	#notice_event_box{
		width:100%;
		height:auto;
		overflow:hidden;
		background: #7da1fd; 
	}
	
	.event_button{
		margin: 0 auto;
		color: #fff;
		font-size: 50px;
		text-align: center;
	}
	
	.event_view_btn{
		height:50px;
		line-height:50px;
		text-align:center;
        width:100%;
		background: #333;
		font-size: 20px;
		color: #fff;
	}
	.event_view_btn:hover{
		background: #000;
	}
	
	.event_view_btn > a{
		font-size: 20px;
		color: #fff;
	}

	
	</style>	
</head>

<body>
  	<!--헤더 시작-->
		<jsp:include page="header.jsp" flush="false"/>
	<!-- 헤어 종료 -->
	
	
	<!--바디페이지-->
	<!-- 슬라이드 부분 -->
	
	 <div class="slider">
    <ul class="slides">
      <li>
        <img src="img/slide1.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h1><b>웹개발자</b>가 되고 싶으세요?</h1>
          <h3 class="light grey-text text-lighten-3"><b>MONDAY</b> 에서 배우세요</h3>
        </div>
      </li>
      <li>
        <img src="img/slide2.jpg"> <!-- random image -->
        <div class="caption left-align">
          <h1><b>웹개발자</b>가 되고 싶으세요?</h1>
          <h3 class="light grey-text text-lighten-3"><b>MONDAY</b> 에서 배우세요</h3>
        </div>
      </li>
      <li>
        <img src="img/slide3.jpg"> <!-- random image -->
        <div class="caption right-align">
          <h1><b>웹개발자</b>가 되고 싶으세요?</h1>
          <h3 class="light grey-text text-lighten-3"><b>MONDAY</b> 에서 배우세요</h3>
        </div>
      </li>
      <li>
        <img src="img/slide4.jpg"> <!-- random image -->
        <div class="caption center-align">
          <h1><b>웹개발자</b>가 되고 싶으세요?</h1>
          <h3 class="light grey-text text-lighten-3"><b>MONDAY</b> 에서 배우세요</h3>
        </div>
      </li>
    </ul>
  </div>
  
	<!-- 검색기능  -->
	<div id="search_box">
		    <!-- 검색창  -->
		<div id="search_title">무엇이든 물어보세요</div>
		<div class="search-wrapper">
		    <div class="input-holder">
		        <input type="text" class="search-input" placeholder="Type to search" />
		        <button class="search-icon" onclick="searchToggle(this, event);"><span></span></button>
		    </div>
		    <span class="close" onclick="searchToggle(this, event);"></span>
		</div>
	</div>
	
	
	<!-- 이벤트 -->	
	<!-- 그리드 형식 나타낼 버튼 -->
	<div id="notice_event_box">
    <div class="container" style="margin:150px auto">
      <div class="event_button">EVENT<a href="#" style="font-size: 20px; line-height:50px; float: right; color:#fff;">+</a></div>
      
      <div class="row">
      <!-- 한칸 그리드 -->
      
      <c:choose>
	      <c:when test="${eventlist == null}">
	      		<div>등록된 게시물이 없습니다.</div>
	      </c:when>
      
      <c:when test="${eventlist != null}">
	      <c:forEach var="list" items="${eventlist}" begin="1" end="3" step="1">
	        <div class="gv-card col-4 my-4">
	          <div class="card">
	            <img
	              class="card-img-top project-image"
	              src="${contextPath}/upload/${list.eventimg1}"
	              alt="Some alternate text"
	            />
	            <div class="card-body">
	              <h3 class="card-title" style="color:#000;">[이벤트] ${list.eventtitle}</h3>
	              <p class="card-text">기간 : ${list.eventday}</p>
	              <div  class="event_view_btn"><a href="${contextPath}/vieweventpage?eventnum=${list.eventnum}">보러가기</a></div>
	            </div>
	          </div>
	        </div>
	        </c:forEach>
        </c:when>
        </c:choose>
      </div>
      <!-- 이벤트 종료 -->
    </div>
	
    <!-- 공지  -->
	
    <script type="text/javascript">
    jQuery(function($)
    		{
    		    var ticker = function()
    		    {
    		        timer = setTimeout(function(){
    		            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
    		            {
    		                $(this).detach().appendTo('ul#ticker').removeAttr('style');
    		            });
    		            ticker();
    		        }, 2000);         
    		      };
    		// 0번 이전 기능
    		      $(document).on('click','.prev',function(){
    		        $('#ticker li:last').hide().prependTo($('#ticker')).slideDown();
    		        clearTimeout(timer);
    		        ticker();
    		        if($('#pause').text() == 'Unpause'){
    		          $('#pause').text('Pause');
    		        };
    		      }); // 0번 기능 끝
    		  
    		// 1. 클릭하면 다음 요소 보여주기... 클릭할 경우 setTimeout 을 clearTimeout 해줘야 하는데 어떻게 하지..
    		      $(document).on('click','.next',function(){
    		            $('#ticker li:first').animate( {marginTop: '-20px'}, 400, function()
    		                    {
    		                        $(this).detach().appendTo('ul#ticker').removeAttr('style');
    		                    });
    		            clearTimeout(timer);
    		            ticker();
    		            //3 함수와 연계 시작
    		            if($('#pause').text() == 'Unpause'){
    		              $('#pause').text('Pause');
    		            }; //3 함수와 연계
    		          }); // next 끝. timer 를 전연변수보다 지역변수 사용하는게 나을 것 같은데 방법을 모르겠네요.

    		  //2. 재생정지기능 시작, 아직 다음 기능과 연동은 안됨...그래서 3을 만듦
    		  var autoplay = true;
    		      $(document).on('click','.pause',function(){
    		            if(autoplay==true){
    		              clearTimeout(timer);
    		              $(this).text('재생');
    		              autoplay=false;
    		            }else{
    		              autoplay=true;
    		              $(this).text('정지');
    		              ticker();
    		            }
    		          }); // 재생정지기능 끝  
    		  // 3. 재생정지 함수 시작. 2와 기능 동일함.
    		    var tickerpause = function()
    		  {
    		    $('#pause').click(function(){
    		      $this = $(this);
    		      if($this.text() == 'Pause'){
    		        $this.text('Unpause');
    		        clearTimeout(timer);
    		      }
    		      else {
    		        ticker();
    		        $this.text('Pause');
    		      }
    		    });
    		   
    		  };
    		  tickerpause();
    		  //3 재생정지 함수 끝
    		  //4 마우스를 올렸을 때 기능 정지
    		  var tickerover = function()
    		  {
    		    $('#ticker').mouseover(function(){
    		      clearTimeout(timer);
    		    });
    		    $('#ticker').mouseout(function(){
    		      ticker();
    		    });  
    		  };
    		  tickerover();
    		  // 4 끝
    		    ticker();
    		    
    		});
    
    </script>
    
    <%
	    NoticeDAO dao2= new NoticeDAO();
		List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
	
		noticeList = dao2.selectnoticeList();
		request.setAttribute("noticeList",noticeList);
	%>
	
  <style type="text/css">
	#notice_id{
		width: 100%;
		height: 50px;
	}
	.none{
		display:none
		}
	#ticker{
		float:left;
		}
	.navi{
		float:right;
		}
	.block {
		height:50px; 
		overflow:hidden; 
		background:#fff; 
		width:80%; 
		font-size:20px;
		margin: 0 auto;
		}
	.block ul,.block li {
		margin:0; 
		padding-left:20px; 
		list-style:none;
	}
	.block li a {
		display:block; 
		height:50px; 
		font-size:15px;
		line-height:50px; 
		color:#555; 
		text-decoration:none;
	}
	.notice_ico1{
		width:50px;
		height: 30px;
		line-height:30px;
		text-align:center;
		border: 2px solid #000;
		font-size: 15px;
		border-radius:30px; 
		margin-top:10px;
		margin-right:10px;
		float: left;
	}
	.notice_title{
		padding-left:50px;
		line-height:50px;
		font-size:20px;
		font-weight:500;
		float: left
	}
	.notice_day{
		float: right;
	}
	.notice_txt{
		width:1000px;
		height:50px;
		float: left;
		padding-right: 30px;
	}
	.navi{
		float:right;
		height: 50px;
		line-height:50px;
	}
	.navi.prev{
		line-height:40px;
	}
	.navi.next{
		line-height:20px;
	}
	
	</style>
    <div id="notice_id">
	    <div class="block">
	    	<span class="notice_title">먼데이에서 알림공지</span>
		    <ul id="ticker">
		    <c:choose>
			    <c:when test="${noticeList == null}">
				    <c:forEach var="list" items="${noticeList}">
					        <li>
						        	등록된글이 없습니다.
					        </li>
			        </c:forEach>
		        </c:when>
			    <c:when test="${noticeList != null}">
				    <c:forEach var="list" items="${noticeList}">
					        <li>
						        <a href="#">
							        <span class="notice_ico1">${list.adminid}</span>
							        <span class="notice_txt">${list.noticetitle}</span>
							        <span class="notice_day">${list.subdate}</span>
						        </a>
					        </li>
			        </c:forEach>
		        </c:when>
		    </c:choose>
		    </ul>
		  <div class="navi">
		    <span class="prev"><img src="img/btn_mn_prev.png"/></span>
		    <span class="next"><img src="img/btn_mn_next.png"/></span>
		   <!--  <span class="pause none">||</span>
		    <span id="pause" class="">Pause</span> -->
		  </div>
		</div>
	</div>
	</div>
    <!-- 공지부분 종료 -->
    <!--Scripts needed to run bootstrap-->
   
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
      integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
      crossorigin="anonymous"
    ></script>
   
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
	
	
	
	<div style="width: 100%; height: 800px; background: #f0f0f0;">
		<h1 align="center" style="line-height: 800px;">장소 qpi 부분 아니면 캘릭더 api</h1>
	</div>
	<!--푸터페이지-->
	<jsp:include page="footer.jsp" flush="false"/>
	<!-- 헤어 종료 -->
</body>
</html>
