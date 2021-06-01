package board.mboard.dao;

import java.sql.*;
import java.util.*;

import board.mboard.vo.*;
import monday.db.*;

public class JavaDao {
	
	Connection conn = null;
	Statement stmt 	= null;
	ResultSet rs 	= null;

	//자바 게시물 목록
	public List<JavaVo> getJavaList() {
		List<JavaVo> javaList= new ArrayList<JavaVo>();
				
		try {
			MondayDB   db    =  new MondayDB(); 		
			conn        	 =  db.getConnection();
			stmt		  	 = conn.createStatement();
			String  sql = "SELECT j_number, j_username, j_subject,";
			sql		+= " j_content, to_char(j_regdate, 'YYYY-MM-DD HH24:MI:SS') j_regdate, j_readcount" ; 
			sql		+=" FROM j_board" ; 
			sql		+=" ORDER BY j_number desc";
			rs		 	  = stmt.executeQuery(sql);
			
			while(rs.next()) {
				JavaVo vo = new JavaVo();
				vo.setJ_number( rs.getInt("j_number") );
				vo.setJ_username(rs.getString("j_username"));
				vo.setJ_subject(rs.getString("j_subject"));
				vo.setJ_content(rs.getString("j_content"));
				vo.setJ_regdate(rs.getString("j_regdate"));
				vo.setJ_readcount(rs.getInt("j_readcount"));
				
				javaList.add( vo ); 
				//System.out.println(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return javaList;
	}
	
	//자바게시판 조회수 증가

	
	public JavaVo updateReadcount(int idx) {
		JavaVo JavaCnt = null;
		
		try {
			MondayDB db = new MondayDB();
			conn		  = db.getConnection();
			stmt		  = conn.createStatement();
			String sql    = "update j_board";
			sql			+= " set j_readcount = j_readcount+1";
			sql			+= " where j_number="+idx;
			
			stmt.executeUpdate(sql);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!= null) rs.close();
				if(stmt!= null) stmt.close();
				if(conn!= null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		return JavaCnt;
		
	}
	
	//게시물 내용 불러오기
	public JavaVo getBoard(String idx) {
		
	      PreparedStatement pstmt = null;
	      JavaVo vo = null;
	      
	      try {
	    	  MondayDB db = new MondayDB();
	    	  conn = db.getConnection();
	    	  
	    	  String sql = "SELECT j_number, j_username, j_subject, j_content, j_regdate, j_readcount" ; 
	    	  sql		+= " FROM j_board" ;
	    	  sql		+= " where j_number = ?";

	    	  
	    	  pstmt = conn.prepareStatement(sql);
	    	  //System.out.println(sql);
	    	  
	    	  pstmt.setInt(1, Integer.parseInt(idx));
	    	  rs = pstmt.executeQuery();
	    	  
	    	  
	    	  if(rs.next()) {
	    		  int idx2 			=	rs.getInt("j_number");
	    		  String username	=	rs.getString("j_username");
	    		  String subject	=	rs.getString("j_subject");
	    		  String content	=	rs.getString("j_content");
	    		  String regdate	=	rs.getString("j_regdate");
	    		  int readcount 	=	rs.getInt("j_readcount");
	    		  vo				= 	new JavaVo(idx2, username, subject, content, regdate, readcount);
	    	  }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	      
	      
		return vo;
	}

	public JavaVo getData(String search) {
		//System.out.println("search : "+ search);
		JavaVo			vo		=	null;
		Connection		conn	=	null;
		PreparedStatement pstmt =	null;
		ResultSet		rs		=	null;
		MondayDB		db		=	null;
		
		try {
			db 			=	new MondayDB();
			conn		=	db.getConnection();
			String sql	= "SELECT j_number,j_username,j_subject," + 
					"    j_content,j_regdate,j_readcount" + 
					" FROM j_board" + 
					" where j_username like ? or" + 
					" j_content like ? or" + 
					" j_subject like ? ";
			pstmt		= conn.prepareStatement(sql);
			pstmt.setString(1, "%"+search+"%");
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			
			rs			= pstmt.executeQuery();
			
			while(rs.next()) {
				
				int number = rs.getInt("j_number");
				String username = rs.getString("j_username");
				String subject = rs.getString("j_subject");
				String content = rs.getString("j_content");
				String regdate = rs.getString("j_regdate");
				int readcount = rs.getInt("j_readcount");
				
				vo = new JavaVo(number, username, subject, content, regdate, readcount);
				
				//System.out.println("vo :" + vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		return vo;
	}
	

	
	//게시글 조회
	public List listBoard() {
		List list = new ArrayList();
		PreparedStatement pstmt;
		try {
			MondayDB db = new MondayDB();
			conn		  = db.getConnection();
			String sql = "SELECT J_NUMBER,j_username,"
					+ "J_Subject,J_Regdate from J_BOARD ORDER BY J_NUMBER DESC";
			
			//System.out.println("prepareStatememt: " + sql);
			pstmt		  = conn.prepareStatement(sql);			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
			
				int j_number = rs.getInt("j_number");
				String j_username = rs.getString("j_username");
				String j_subject = rs.getString("j_subject");
				String j_regdate = rs.getString("j_regdate");

				JavaVo vo = new JavaVo();
				vo.setJ_number(j_number);
				vo.setJ_username(j_username);
				vo.setJ_subject(j_subject);
				vo.setJ_regdate(j_regdate);
				list.add( vo ); 
				//System.out.println(vo);
			}
			rs.close();
			pstmt.close();
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 게시글 쓰기
		public void insertBoard(String boardname, String j_username, String j_subject, String j_content) {
			try {
				MondayDB db = new MondayDB();
				conn		  = db.getConnection();
				
				//conn.setAutoCommit(false);			
				//cont = cont.replace("<", "&lt;");			
				
				stmt       = conn.createStatement();
				String sql = "INSERT INTO J_BOARD (J_NUMBER, MENU_ID, j_username, j_subject , j_content, j_regdate, j_readcount)";
				sql       += " VALUES ((SELECT NVL(MAX(J_NUMBER),0)+1 FROM J_BOARD),";
				sql       += "'" + boardname + "'" + "," ;
				sql       += "'" + j_username + "'" + "," ;
				sql       += "'" + j_subject + "'" + "," ;
				sql       += "'" + j_content + "'" + ",";
				sql       +=  " sysdate" + ",";
				sql       += "1" + ")";
				//System.out.println("\ninsertBoard:" + sql);
				stmt.executeUpdate(sql);
				
				//conn.commit();
				
			} catch (SQLException e) {
				// conn.rollback();
				e.printStackTrace();
			} catch (Exception e) {			
				e.printStackTrace();
			} finally {
				try {				
					if(stmt  != null) stmt.close();
					if(conn  != null) conn.close();
				} catch (SQLException e) {				
					e.printStackTrace();
				}
			}
		}
		
	

}
