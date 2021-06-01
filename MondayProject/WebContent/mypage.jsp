<!doctype html>
<%@page import="monday.db.MondayDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<% //로그인이 되었이어야  보여지도록 검증
   if(session.getAttribute("memId") == null){
       response.sendRedirect("main.jsp");
   }else{
%>
<html>
<head>
<meta charset="utf-8">
<title> 월요일</title>
<link rel="stylesheet" href="css/main_v2.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
<script type="text/javascript">
      $(document).ready(function(){
        
            
      });
</script>    
	
</head>

<body>
  <!--헤더페이지-->
  <jsp:include page="header.jsp" flush="false"/>
	<!--바디페이지-->
	<div id="bodys">
<%
	try {
		String session_email  = (String)session.getAttribute("email");
		
		MondayDB db = new MondayDB();
		Connection conn		  = db.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("SELECT name,email,password,age,BIO,JOB,INTER FROM SIGNUP WHERE email = ?");

		// 쿼리만들어주기 
		pstmt.setString(1, session_email); 

		

		ResultSet rs = pstmt.executeQuery(); 
		while(rs.next()){
					String name      = rs.getString(1); // 결과 쿼리의 1번째 행의 값을 가져온다. id 가 첫번째 이므로 id의 값을 가져온다.
					String email     = rs.getString(2);
					String password  = rs.getString(3);
					String age	     = rs.getString(4);
					String bio	     = rs.getString(5);
					String job	     = rs.getString(6);
					String inter     = rs.getString(7);
					System.out.println(name);
	%>
	
		<tr>
			<td>Welcome, <b><%= name %></b>! This is your data.</td>
			<td>email : <b><%=email %></b></td>
			<td>password : <b><%=password %></b></td>
			<td>name : <b><%=name %></b></td>
			<td>age :<b><%= age %></b></td>
			<td>bio :<b><%= bio %></b></td>
			<td>job :<b><%= job %></b></td>
			<td>inter :<b><%= inter %></b></td>
		</tr>
		
	<% 
		}
		
	
		
		pstmt.close();
		conn.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	%>

	</div>
	<!--푸터페이지-->
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>
<%}%>