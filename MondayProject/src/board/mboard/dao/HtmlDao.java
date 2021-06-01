package board.mboard.dao;

import java.sql.*;
import java.util.*;

import board.mboard.vo.*;
import monday.db.*;
import oracle.jdbc.internal.*;

public class HtmlDao {
	

	public List<HtmlVo> getHtmlList(String menu_id) {
		List<HtmlVo> htmlList 	= new ArrayList<HtmlVo>();
		
		Connection conn = null;
		CallableStatement cstmt = null;
		ResultSet rs 	= null;
		MondayDB db 			= null;
		
		try {
			db			= new MondayDB();
			conn		= db.getConnection();
			String sql  = "{CALL PKG_H_BOARD.PROC_H_BOARD_LIST(?,?)}"; 

			cstmt		= conn.prepareCall(sql);
			
			cstmt.setString(1, menu_id);
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			
			rs = ocstmt.getCursor(2);
			
			while(rs.next()) {
				int idx			= rs.getInt("IDX");
				String title	= rs.getString("TITLE");
				String cont		= rs.getString("CONT");
				String writer	= rs.getString("WRITER");
				String regdate	= rs.getString("REGDATE");
				int readcount	= rs.getInt("READCOUNT");
				int bnum		= rs.getInt("BNUM");
				int lvl			= rs.getInt("LVL");
				int step		= rs.getInt("STEP");
				int nref		= rs.getInt("NREF");
				
				HtmlVo vo = new HtmlVo(idx, menu_id, title, cont, writer, regdate, readcount, bnum, lvl, step, nref);
				
				htmlList.add(vo);

			}
			
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					if(rs!=null) rs.close();
					if(cstmt!=null) cstmt.close();
					if(conn!=null) conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		
		return htmlList;
	}
	
	//게시물 보기
	public HtmlVo getBoard(String idx) {
		HtmlVo vo = null;
		
		Connection         conn  = null;
		CallableStatement  cstmt = null;
		ResultSet          rs    = null;
		MondayDB   db   =  null;
		try {
			db          = new MondayDB();
			conn        = db.getConnection();
			String sql  = "{CALL PKG_H_BOARD.PROC_H_BOARD_VIEW(?, ?) }";
			cstmt       = conn.prepareCall(sql); 
			cstmt.setInt(1,  Integer.parseInt( idx ) );
			cstmt.registerOutParameter(2, oracle.jdbc.OracleTypes.CURSOR);
			
			cstmt.execute();
			System.out.println("여기까지 실행");
			
			OracleCallableStatement ocstmt = (OracleCallableStatement) cstmt;
			rs    =  ocstmt.getCursor(2);
			
			rs.next();
			
			vo = new HtmlVo();
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

	public void insertBoard(HtmlVo vo) {
		
		Connection 			conn = null;
		CallableStatement  cstmt = null;
		
		MondayDB db = null;
		
		try {
			db			= new MondayDB();
			conn		= db.getConnection();
			String sql  = "{CALL PKG_H_BOARD.PROC_H_BOARD_INSERT(?,?,?,?,?,?,?,?)}";
			cstmt		= conn.prepareCall(sql);
			cstmt.setString(1, vo.getMenu_id());
			cstmt.setString(2, vo.getTitle());
			cstmt.setString(3, vo.getCont());
			cstmt.setString(4, vo.getWriter());
			cstmt.setInt(5, vo.getBnum());
			cstmt.setInt(6, vo.getLvl());
			cstmt.setInt(7, vo.getStep());
			cstmt.setInt(8, vo.getNref());

			cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
		
		
	}

	public void boardUpdate(String idx, String title, String cont) {
		
		Connection conn = null;
		CallableStatement cstmt = null;
		
		MondayDB  db = null;
		
		try {
			db			= new MondayDB();
			conn		= db.getConnection();
			String sql  = "{CALL PKG_H_BOARD.PROC_H_BOARD_UPDATE(?,?,?)}";
			cstmt		= conn.prepareCall(sql);
			cstmt.setInt(1, Integer.parseInt(idx));
			cstmt.setString(2, title);
			cstmt.setString(3, cont);
			
			cstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
	}

	public void boardDelete(String idx) {
		
		Connection conn = null;
		CallableStatement cstmt = null;
		
		MondayDB db = null;
		
		try {
			db 			= new MondayDB();
			conn		= db.getConnection();
			String sql	= "{CALL PKG_H_BOARD.PROC_H_BOARD_DELETE(?)}";
			cstmt		= conn.prepareCall(sql);
			cstmt.setInt(1, Integer.parseInt(idx));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(cstmt!=null) cstmt.close();
				if(conn!=null)  conn.close();
			} catch(Exception e) {				
			}
		}
		
	}
	
	
	//전체 게시물 수를 반환
	public int getTotalRecord() {
		
		int totalNum = 0;
		
		Connection conn		=	null;
		Statement  stmt		=   null;
		ResultSet  rs		=	null;
		
		try {
			MondayDB db = new MondayDB();
			conn		= db.getConnection();
			stmt		= conn.createStatement();
			String sql 	= "SELECT COUNT(*) FROM H_BOARD";
			rs			= stmt.executeQuery(sql);
		
		if(rs.next()) {
			totalNum = rs.getInt(1);
		}
		
		
		} catch (SQLException e) {
			System.out.println("getTotalRecord() 에러발생"+e.getMessage());
		} finally {
			try {
				if(rs!= null) rs.close();
				if(stmt!= null) stmt.close();
				if(conn!= null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return totalNum;
	}
	


}
