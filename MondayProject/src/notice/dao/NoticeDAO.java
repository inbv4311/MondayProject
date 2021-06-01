package notice.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import notice.vo.NoticeVO;

public class NoticeDAO {

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
	
	 public void insertNotice(NoticeVO notice)throws Exception{
 
		 int cnt = 0;
	        
	        try{
	            //커넥션 풀로 부터 커넥션 할당
	            connDB();
	            System.out.println("디비연결되었다아아---------");
	            String sql ="insert into notice(noticenum,ADMINID,NOTICETITLE,NOTICECONTENT)";
	            sql		  +=" values((SELECT NVL(MAX(noticenum), 0)+1 FROM notice),?,?,?)";
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(++cnt, notice.getAdminid());
	            pstmt.setString(++cnt, notice.getNoticetitle());
	            pstmt.setString(++cnt, notice.getNoticecontent());

	            System.out.println(sql);
	            pstmt.executeUpdate();
	        }catch(Exception e){
	            e.printStackTrace();
	        }finally{
	            execClose(null,pstmt,conn);
	        }
	    }

	 //공지 목록리스트
	public List<NoticeVO> selectnoticeList() {
		List<NoticeVO> list = new ArrayList();
		String sql ="";
		try {
			connDB();
			sql ="select noticenum,adminid,noticetitle,subdate from notice order By noticenum desc";
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int 	noticenum 		= rs.getInt("noticenum");
				String 	adminid 		= rs.getString("adminid");
				String 	noticetitle 	= rs.getString("noticetitle");
				Date 	subdate 		= rs.getDate("subdate");

				NoticeVO vo = new NoticeVO();
				vo.setNoticenum(rs.getInt("noticenum"));
				vo.setAdminid(rs.getString("adminid"));
				vo.setNoticetitle(rs.getString("noticetitle"));
				vo.setSubdate(rs.getDate("subdate"));
				
				list.add(vo);
			}
			
				
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
		
	}
	//공지 수정
    public void updateNotice(String noticenum) throws Exception{
     
        int cnt =0;
        try{
        	connDB();
            String sql = " UPDATE notice SET noticetitle=?,noticecontent =?,imagefilename=?";
            sql		  +=" WHERE noticenum = ?";
            pstmt =conn.prepareStatement(sql);
            NoticeVO vo = new NoticeVO();
            System.out.println("sql");
            pstmt.setString(++cnt, vo.getNoticetitle());
            pstmt.setString(++cnt, vo.getNoticecontent());
            pstmt.setString(++cnt, vo.getImagefilename());
            pstmt.setInt(++cnt, vo.getNoticenum());
            
            pstmt.executeUpdate();
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }   
    
    //공지 수정 창 보여주기
    public NoticeVO getNotice(String noticenum) throws Exception{
    	
    	  NoticeVO notice=null;
          String sql="";
          try{
          	connDB();
              sql="select*from notice where noticenum= ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, noticenum);
              rs= pstmt.executeQuery();
              
              if(rs.next()){
            	  notice = new NoticeVO();
            	  notice.setNoticenum(rs.getInt("noticenum"));
            	  notice.setAdminid(rs.getString("adminid"));
            	  notice.setNoticetitle(rs.getString("noticetitle"));
            	  notice.setNoticecontent(rs.getString("noticecontent"));
            	  notice.setImagefilename(rs.getString("imagefilename"));
                  System.out.println(sql);
              }
          }catch(Exception ex){
              ex.printStackTrace();
          }finally{
              execClose(rs,pstmt,conn);
          }
          return notice;
    	
    }
    
	//공지 삭제
    public void deleteMember(String noticenum)throws Exception{
        
        try{
        	connDB();
            String sql = "delete from notice where noticenum=?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, noticenum);
            pstmt.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(null,pstmt,conn);
        }
    }
	
	public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
        //자원정리
        if(rs !=null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
        //커넥션 풀로 반납
        if(conn !=null) try{conn.close();}catch(SQLException sqle){}
    }
}
