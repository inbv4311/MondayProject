<%@page import="event.dao.EventDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="event.vo.EventVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
 //리스트 목록 출력
      List<EventVO> eventlist = new ArrayList<EventVO>();
	  EventDAO dao = new EventDAO();
      eventlist = dao.seleteventlist();
      request.setAttribute("eventlist", eventlist);
      
      String nextpath="eventlist.jsp";

	  RequestDispatcher dispath = request.getRequestDispatcher(nextpath);
	  dispath.forward(request, response);
      
%> 