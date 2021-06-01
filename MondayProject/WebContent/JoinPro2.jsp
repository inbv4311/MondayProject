<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
	try {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("pass1");
		String ages = request.getParameter("ages");
		String bio = request.getParameter("bio");
		String job = request.getParameter("user_job");
		String inter = request.getParameter("user_interest");
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn =   DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "boeun","1234"); // 드라이버 연결
		PreparedStatement pstmt = conn.prepareStatement("INSERT INTO SIGNUP (name,email,password,age,BIO,JOB,INTER) VALUES(?,?,?,?,?,?,?)"); // 쿼리만들어주기 
		pstmt.setString(1, name); // preparestatment 의 ? 에 값을 넣어줍니다 . ?의 순서대로 1,2,3,4 로 값을 넣어줍니다.
		pstmt.setString(2, email);
		pstmt.setString(3, password);
		pstmt.setString(4, ages);
		pstmt.setString(5, bio);
		pstmt.setString(6, job);
		pstmt.setString(7, inter);
		pstmt.executeUpdate();// select같은 조회는 executeQuery() 를 해주지만 데이터에 수정이 생길 경우 executeUpdate() 해줍니다.
		
		pstmt.close();
		conn.close();
		out.println("<script>alert('You are now registered!'); location.href='loginForm.jsp'</script>");
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>
</body>
</html>