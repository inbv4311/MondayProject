package event.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import event.vo.EventVO;

public class EventDAO {
	
	private String driver 	= "oracle.jdbc.OracleDriver";
	private String url 		= "jdbc:oracle:thin:@localhost:1521:XE";
	private String dbuid 	= "boeun";
	private String dbpwd 	= "1234";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	
	private void connDB() {
		try {
			
			Class.forName(driver);
			System.out.println("Oracle 연결성공");
			conn = DriverManager.getConnection(url, dbuid, dbpwd);
			System.out.println("Connection 연결성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int upload2(EventVO vo) {
		connDB();
		try {
			
			String sql ="insert into event(eventnum,eventtitle,eventcontent,eventimg1,eventimg2,eventday)" ; 
			sql 	  +=" values((SELECT NVL(MAX(eventnum),0)+1 FROM event),?,?,?,?,?)";
			
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getEventtitle());
			pstmt.setString(2, vo.getEventcontent());
			pstmt.setString(3, vo.getEventimg1());
			pstmt.setString(4, vo.getEventimg2());
			pstmt.setString(5, vo.getEventday());
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
		
	}
	public int upload(String eventtitle,String eventcontent, String eventimg1,String eventimg2,String eventday) {
		connDB();
		try {
			
			String sql ="insert into event(eventnum,eventtitle,eventcontent,eventimg1,eventimg2,eventday)" ; 
			sql 	  +=" values((SELECT NVL(MAX(eventnum),0)+1 FROM event),?,?,?,?,?)";
			
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, eventtitle);
			pstmt.setString(2, eventcontent);
			pstmt.setString(3, eventimg1);
			pstmt.setString(4, eventimg2);
			pstmt.setString(5, eventday);
			
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
		
	}
	
	 //회원탈퇴 , 회원정보 삭제
    public void deleteEvent(String eventnum)throws Exception{
        
        try{
        	connDB();
            String sql = "delete from event where EVENTNUM=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, eventnum);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }
	
	public List<EventVO> seleteventlist() throws Exception {
		List<EventVO> eventlist = new ArrayList<EventVO>();
		connDB();
		try {
			String sql ="SELECT EVENTNUM,EVENTTITLE,EVENTIMG1,EVENTDAY,EVENTDATE FROM EVENT ORDER BY EVENTNUM DESC";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				
				int eventnum = rs.getInt("eventnum");
				String eventtitle = rs.getString("eventtitle");
				String eventimg1 = rs.getString("eventimg1");
				String eventday = rs.getString("eventday");
				Date eventdate = rs.getDate("eventdate");
				
				EventVO vo = new EventVO();
				vo.setEventnum(rs.getInt("eventnum"));
				vo.setEventtitle(rs.getString("eventtitle"));
				vo.setEventimg1(rs.getString("eventimg1"));
				vo.setEventday(rs.getString("eventday"));
				vo.setEventdate(rs.getDate("eventdate"));
				eventlist.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
			return eventlist;
		
	}
	
	//종료
	public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
        //자원정리
        if(rs !=null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
        //커넥션 풀로 반납
        if(conn !=null) try{conn.close();}catch(SQLException sqle){}
    }





}
