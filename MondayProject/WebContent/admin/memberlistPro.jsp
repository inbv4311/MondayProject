<%@page import="member.vo.MemberVo"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Timestamp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
    
<%
    request.setCharacterEncoding("utf-8");
%>  

<%
    MemberDAO dao= new MemberDAO();
	List<MemberVo> memberList = new ArrayList<MemberVo>();

	memberList = dao.selectmemberList(); 
	request.setAttribute("memberList",memberList);
	
	String nextpath="memberlist.jsp";

	RequestDispatcher dispath = request.getRequestDispatcher(nextpath);
	dispath.forward(request, response);
	
%>
