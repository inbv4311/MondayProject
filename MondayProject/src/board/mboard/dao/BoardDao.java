package board.mboard.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.mboard.db.DBCon;
import board.mboard.vo.BoardVo;
import oracle.jdbc.OracleCallableStatement;

public class BoardDao {

	// 목록 조회
	public List<BoardVo> getBoardList(String menu_id) {
		List<BoardVo>  boardList = new ArrayList<BoardVo>();
		
		Connection        conn   = null;
		CallableStatement cstmt  = null;		
		ResultSet         rs     = null;
		
		DBCon  db = null;		
		try {
			db         = new DBCon();
			conn       = db.getConnection();
			
			String sql = "{CALL PKG_MBOARD.PROC_MBOARD_LIST(?, ?) }";
			cstmt      = conn.prepareCall(sql);
			
			cstmt.setString(1,  menu_id);  // in 파라미터
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			   // out 파라미어를 미리 등록한다
			
			cstmt.execute(); // sqldeveloper ctrl+ enter
			
		   //   rs = cstmt.getResultSet(); // 작동안됨
			
			OracleCallableStatement ocstmt 
			      = (OracleCallableStatement) cstmt;
			
			rs   =  ocstmt.getCursor(2);
						
			while(rs.next() ) {
				
//				BoardVo vo = new BoardVo(); 
//				vo.setIdx( rs.getInt("idx") );
				 
				int     idx        = rs.getInt("idx");
				String  title      = rs.getString("title"); 
				String  cont       = rs.getString("cont"); 
				String  writer     = rs.getString("writer"); 
				String  regdate    = rs.getString("regdate"); 
				int     readcount  = rs.getInt("readcount");  
				int     bnum       = rs.getInt("bnum");  
				int     lvl        = rs.getInt("lvl");  
				int     step       = rs.getInt("step");  
				int     nref       = rs.getInt("nref");  
				BoardVo vo = new BoardVo(idx, title, cont, 
						writer, regdate, readcount, 
						bnum, lvl, step, nref, menu_id); 
				boardList.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)    rs.close();
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {
				
			}
		}
		
		return  boardList;
	}
	
	// 내용보기
	public BoardVo getBoard(String idx) {
		BoardVo vo = null;
		
		Connection         conn  = null;
		CallableStatement  cstmt = null;
		ResultSet          rs    = null;
		
		DBCon   db   =  null;
		try {
			db          = new DBCon();
			conn        = db.getConnection();
			String sql  = "{CALL PKG_MBOARD.PROC_MBOARD_VIEW(?, ?) }";
			cstmt       = conn.prepareCall(sql); 
			cstmt.setInt(1,  Integer.parseInt( idx ) );
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			
			cstmt.executeQuery();
			
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			rs    =  ocstmt.getCursor(2);
			
			rs.next();
			
			vo = new BoardVo();
			vo.setIdx(rs.getInt("idx"));
			vo.setTitle(rs.getString("title"));
			vo.setCont(rs.getString("cont"));
			vo.setWriter(rs.getString("writer"));			
			vo.setRegdate(rs.getString("regdate"));
			vo.setReadcount(rs.getInt("readcount"));
			vo.setBnum(rs.getInt("bnum"));
			vo.setLvl(rs.getInt("lvl"));
			vo.setStep(rs.getInt("step"));
			vo.setNref(rs.getInt("nref"));			
			vo.setMenu_id(rs.getString("menu_id"));
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)    rs.close();
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
		return vo;
	}

	// 새 글 쓰기
	public void setBoardInsert(BoardVo vo) {
		
		Connection          conn  = null;
		CallableStatement   cstmt = null; 

		DBCon   db = null;
		try	{
			db          =  new DBCon(); 
			conn        =  db.getConnection();
			String sql  =  "{CALL PKG_MBOARD.PROC_MBOARD_INSERT(?,?,?,?,?,?,?,?)}"; 
			cstmt       =  conn.prepareCall(sql);
			cstmt.setString( 1, vo.getMenu_id() );
			cstmt.setString( 2, vo.getTitle() );
			cstmt.setString( 3, vo.getCont() );
			cstmt.setString( 4, vo.getWriter() );
			cstmt.setInt(    5, vo.getBnum() );
			cstmt.setInt(    6, vo.getLvl() );
			cstmt.setInt(    7, vo.getStep() );
			cstmt.setInt(    8, vo.getNref() );
			
			cstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
		
	}

	
	// 글 수정
	public void setBoardUpdate(String idx, String title, String cont) {
		
		Connection         conn   = null;
		CallableStatement  cstmt  = null;
		
		DBCon      db   =  null;
		try {
			db         = new DBCon();
			conn       = db.getConnection();
			String sql = "{CALL PKG_MBOARD.PROC_MBOARD_UPDATE(?,?,?) }";
			cstmt      = conn.prepareCall(sql); 
			cstmt.setInt(1, Integer.parseInt(idx) );
			cstmt.setString(2,  title);
			cstmt.setString(3,  cont);
			
			cstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
	}

	

}












