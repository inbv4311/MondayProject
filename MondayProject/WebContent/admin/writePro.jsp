<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.List"%>
<%@page import="notice.vo.NoticeVO"%>
<%@page import="notice.dao.NoticeDAO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("utf-8");
%>  

<jsp:useBean id="vo" class="notice.vo.NoticeVO">
	<jsp:setProperty name ="vo" property="*"/> 
</jsp:useBean>

<%
	NoticeDAO dao = new NoticeDAO();
	dao.insertNotice(vo);
	
	List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
	
	noticeList = dao.selectnoticeList();
	
	request.setAttribute("noticeList", noticeList);
	String nextpath ="noticelist.jsp";
	
	RequestDispatcher dispath = request.getRequestDispatcher(nextpath);
	dispath.forward(request, response);
	
%>


	