<%@page import="event.vo.EventVO"%> 
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="event.dao.EventDAO"%>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>

<%
    request.setCharacterEncoding("utf-8");
	
%>  


 <%
	 
      String directory = application.getRealPath("/upload/");
      int maxSize = 1024*1024*100;
      String encoding="utf-8";
      
      MultipartRequest multipartRequest 
      = new MultipartRequest(request, directory, maxSize, encoding,
            new DefaultFileRenamePolicy()); 
      
   
      
      String eventtitle 	= multipartRequest.getParameter("eventtitle");
      String eventcontent 	= multipartRequest.getParameter("eventcontent");
      String eventday 		= multipartRequest.getParameter("eventday");
      
      String eventimg1 		= multipartRequest.getOriginalFileName("eventimg1");
      String fileRealName 	= multipartRequest.getFilesystemName("eventimg1");
      String eventimg2 		= multipartRequest.getOriginalFileName("eventimg2");
      String fileRealName2 	= multipartRequest.getFilesystemName("eventimg2"); 
      
      //데이터 넣기 
      EventDAO dao = new EventDAO();
      dao.upload(eventtitle,eventcontent,eventimg1,eventimg2,eventday);
      
      //리스트 목록 출력
      List<EventVO> eventlist = new ArrayList<EventVO>();
      eventlist = dao.seleteventlist();
      request.setAttribute("eventlist", eventlist);
      
      String nextpath="eventlist.jsp";

	  RequestDispatcher dispath = request.getRequestDispatcher(nextpath);
	  dispath.forward(request, response);
      
%> 

   