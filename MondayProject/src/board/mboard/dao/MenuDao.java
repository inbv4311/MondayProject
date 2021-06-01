package board.mboard.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import board.mboard.db.DBCon;
import board.mboard.vo.MenuVo;
import oracle.jdbc.OracleCallableStatement;

public class MenuDao {

	public List<MenuVo> getMenuList() {
		List<MenuVo> menuList = new ArrayList<MenuVo>();
		
		Connection          conn   = null;
		CallableStatement   cstmt  = null;  
		ResultSet           rs     = null;
		
		DBCon   db    =  null;
		try {
			db          =  new DBCon(); 		
			conn        =  db.getConnection();
			String  sql = "{CALL PKG_MBOARD.PROC_MENU_LIST(?)}";
			cstmt       =  conn.prepareCall(sql);
			
			cstmt.registerOutParameter(1, 
					oracle.jdbc.OracleTypes.CURSOR);
			cstmt.execute();
			
			OracleCallableStatement ocstmt 
			     = (OracleCallableStatement) cstmt;
			rs = ocstmt.getCursor(1);
			
			while(rs.next()) {
				MenuVo vo = new MenuVo();
				vo.setMenu_id( rs.getString("menu_id") );
				vo.setMenu_name(rs.getString("menu_name"));
				vo.setMenu_seq(rs.getInt("menu_seq"));
				
				menuList.add( vo ); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return menuList;
	}

	public void menuInsert(MenuVo menuVo) {
		
		Connection        conn  = null;
		CallableStatement cstmt = null;
		
		String menu_name = menuVo.getMenu_name();
		
		DBCon   db = null;	
		try {
			db = new DBCon();
			conn       = db.getConnection();
			String sql = "{CALL PKG_MBOARD.PROC_MENU_INSERT(?)}";
			cstmt      = conn.prepareCall(sql);
			
			cstmt.setString(1, menu_name);			
			cstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}  finally {
			try {
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}

	public MenuVo getMenu(String menu_id) {
		Connection         conn  = null;
		CallableStatement  cstmt = null;
		ResultSet          rs    = null;
		
		// 'MENU05', :O_MENU_ID, :O_MENU_NAME, :O_MENU_SEQ
		MenuVo  menuVo = null;
		DBCon   db   = null;
		try {
			db         = new DBCon();
			conn       = db.getConnection();
			String sql = "{CALL pkg_mboard.proc_menu_view(?,?,?,?)}";				
			cstmt      = conn.prepareCall(sql);			
			
			System.out.println("getmenu:" +  menu_id);
			
			cstmt.setString(1, menu_id);
			cstmt.registerOutParameter(2, Types.VARCHAR);     // char
			cstmt.registerOutParameter(3, Types.VARCHAR);  // varchar2
			cstmt.registerOutParameter(4, Types.NUMERIC);  // number
			
			cstmt.executeQuery();
			String  o_menu_id    = cstmt.getString(2);
			String  o_menu_name  = cstmt.getString(3);
			int     o_menu_seq   = cstmt.getInt(4);
			menuVo   = new MenuVo( cstmt.getString(2), 
					o_menu_name, o_menu_seq); 
			System.out.println("getMenu:" + menuVo );
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( rs    != null ) rs.close();
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return menuVo;
	}

	public void updateMenu(MenuVo menuVo) {
		
		Connection        conn   = null;
		CallableStatement cstmt  = null;
		
		DBCon     db  = null;
		try {
			db         = new DBCon();
			conn       = db.getConnection();
			String sql = "{CALL PKG_MBOARD.PROC_MENU_UPDATE(?,?,?)}";
			cstmt      = conn.prepareCall(sql); 
			
			System.out.println("updateMenu menuVo:" + menuVo.getMenu_id());
			System.out.println("updateMenu menuVo:" + menuVo.getMenu_name());
			System.out.println("updateMenu menuVo:" + menuVo.getMenu_seq());
			
			cstmt.setString(1, menuVo.getMenu_id());
			cstmt.setString(2, menuVo.getMenu_name() );
			cstmt.setInt(3,  menuVo.getMenu_seq());
			
			cstmt.executeUpdate();
					
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	// 메뉴삭제
	public void deleteMenu(String menu_id) {
		Connection         conn  = null;
		CallableStatement  cstmt = null;
		
		DBCon  db   = null;
		try {
			db   =  new DBCon();
			conn        =  db.getConnection();
			String sql  =  "{CALL  PKG_MBOARD.PROC_MENU_DELETE(?) }";
			cstmt       =  conn.prepareCall(sql);
			cstmt.setString(1, menu_id);
			
			cstmt.executeUpdate();
		
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
				
		
	}

	public String getMenuName(String menu_id) {
		
		String  menu_name = "";

		Connection        conn  = null;
		CallableStatement cstmt = null;
		
		DBCon   db       = null;
		try {
			db         =  new DBCon();
			conn       =  db.getConnection();
			String sql =  "{CALL PKG_MBOARD.PROC_MENU_GETNAME(?, ?)}";			
			cstmt      =  conn.prepareCall(sql);
			cstmt.setString(1, menu_id);
			cstmt.registerOutParameter(2, Types.VARCHAR);
			
			cstmt.executeQuery();
			
			menu_name = cstmt.getString(2);			
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if( cstmt != null ) cstmt.close();
				if( conn  != null ) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return menu_name;
	}
	
}

















