<%@page import="notice.vo.NoticeVO"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
    
<%
    request.setCharacterEncoding("utf-8");
	
%>  


<%
    NoticeDAO dao= new NoticeDAO();
	List<NoticeVO> noticeList = new ArrayList<NoticeVO>();

	noticeList = dao.selectnoticeList();
	request.setAttribute("noticeList",noticeList);
	
	String nextpath="noticelist.jsp";

	RequestDispatcher dispath = request.getRequestDispatcher(nextpath);
	dispath.forward(request, response);
	
%>
