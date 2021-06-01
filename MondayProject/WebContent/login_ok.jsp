<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	
	try {
		int count = 0;
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email"); 
		String password = request.getParameter("password");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn =   DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "boeun","1234"); 
		PreparedStatement pstmt = conn.prepareStatement("SELECT email , password FROM SIGNUP WHERE email = ? AND password = ?"); // 쿼리만들어주기 
		pstmt.setString(1, email); 
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
		if(rs.next()){
			
					count++; // rs가 한번이라도  돌면 count 의 값을 올려줍니다.
					session.setAttribute("email", email);
		}
		if(count == 0){
			session.invalidate();
			out.println("<script>alert('다시 입력 하세요'); location.href='login.html'</script>"); // 만약에 rs 가 한번도 안돌았으면
		}
		else if(count ==1){
			out.println("<script>alert('"+ email +"'님 로그인 되었습니다.'); location.href='main.jsp'</script>");// 만약에 rs 가 한번 돌았으면 그 값이 있다는 뜻
		}
		if(email.equals("admin")&&password.equals("1234")){
			out.println("<script>alert('관리자님 환영합니다.'); location.href='/admin/main.jsp'</script>");// 만약에 rs 가 한번 돌았으면 그 값이 있다는 뜻
		}
		
		pstmt.close();
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	} 
	%>
