package board.mboard.dao;

import java.sql.*;
import monday.db.*;

public class MemberDao {

	Connection conn = null;
	Statement stmt 	= null;
	ResultSet rs 	= null;
	PreparedStatement pstmt = null;
	
	//로그인 체크
	 public int userCheck(String email, String password)throws Exception{
	        
		 	MondayDB db				=	null;
	       
	        try {
	    		int count = 0;
	    			
	    			String sql ="SELECT email , password FROM SIGNUP WHERE email = ? AND password = ?"; // 쿼리만들어주기 
	    			pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, email); 
					pstmt.setString(2, password);
					ResultSet rs = pstmt.executeQuery(); // 결과값을 뽑아줍니다.
					   
					    			if(count == 0){
					    				
					    			System.out.println("로그인성공"); // 만약에 rs 가 한번도 안돌았으면
					}
					else if(count ==1){
						System.out.println("로그인실패");// 만약에 rs 가 한번 돌았으면 그 값이 있다는 뜻
							}
							pstmt.close();
							conn.close();
						}
						catch(Exception e){
						e.printStackTrace();
						}
			return 0; 
					}
	
	//이메일 중복확인
	public int emailCheck(String email) {
		PreparedStatement pstmt = null ;
		ResultSet 			rs  = null;
		int result 				= 0;
		MondayDB db				=	null;
		
		try {
			db					=	new MondayDB();
			conn				=	db.getConnection();
			
			String 		sql		= 	"Select count(*) from signup where email=?";			
			pstmt				=	conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs					=	pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	private void execClose(ResultSet rs2, PreparedStatement pstmt2, Connection conn2) {
		//자원정리
        if(rs !=null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
        //커넥션 풀로 반납
        if(conn !=null) try{conn.close();}catch(SQLException sqle){}
	}
	
}
