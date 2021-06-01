<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="member.dao.MemberDAO"%>
    
<%
    request.setCharacterEncoding("utf-8");

    String email =request.getParameter("email");
    String password =request.getParameter("password");
    
    MemberDAO dao = new MemberDAO();
    int check = dao.userCheck(email, password);
    
    //userCheck에서 x를 return 받아서 로긴체크 
    //history.go(-1); : 전페이지로 (입력창)
    if(check==1){
        //로그인 성공
        session.setAttribute("memId",email);
        response.sendRedirect("main.jsp");
        
    }else if(email.equals("admin") && password.equals("1234")){
    	session.setAttribute("adminId",email);
        response.sendRedirect("/admin/main.jsp");
    }
    
    else if(check==0){    
%>  
    <script>
        alert("비밀번호가 맞지 않습니다.");
        history.go(-1);        
    </script>
<%}else{ %>
    <script>
        alert("아이디가 맞지 않습니다.");
        history.go(-1);        
    </script>
<%} %>