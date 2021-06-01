package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.vo.MemberVo;
import notice.vo.NoticeVO;

public class MemberDAO {
	
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
	
	//회원 아이디 , 비밀번호 체크
    public int userCheck(String email, String password)throws Exception{
        String dbpasswd="";
        int x = -1;
        try{
        	connDB();
        	String sql ="select password from SIGNUP where email = ?";
            pstmt =conn.prepareStatement(sql);
            pstmt.setString(1, email);
            rs=pstmt.executeQuery();
            
            if(rs.next()){
                dbpasswd =rs.getString("password");
                if(dbpasswd.equals(password))
                    x=1; //인증성공
                else
                    x=0; //비밀번호 틀림
            }else
                x=-1; //해당 아이디 없음
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            execClose(rs,pstmt,conn);
        }
        return x;
    }
    
	
    
    
    public List<MemberVo> selectmemberList() {
    	List<MemberVo> list = new ArrayList();
		String sql = "";
		try {
			connDB();
			sql="select name,email,password,age,bio,job,inter from SIGNUP ORDER by name desc";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getString("name");
				String email = rs.getString("email");
				String password = rs.getString("password");
				String age = rs.getString("age");
				String bio = rs.getString("bio");
				String job = rs.getString("job");
				String inter = rs.getString("inter");
				
				MemberVo vo = new MemberVo();
				vo.setName(rs.getString("name"));
				vo.setEmail(rs.getString("email"));
				vo.setPassword(rs.getString("password"));
				vo.setAge(rs.getString("age"));
				vo.setBio(rs.getString("bio"));
				vo.setJob(rs.getString("job"));
				vo.setInter(rs.getString("inter"));

				list.add(vo);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
    
    public void execClose(ResultSet rs, PreparedStatement pstmt, Connection conn)throws Exception{
        //자원정리
        if(rs !=null) try{rs.close();}catch(SQLException sqle){}
        if(pstmt !=null) try{pstmt.close();}catch(SQLException sqle){}
        //커넥션 풀로 반납
        if(conn !=null) try{conn.close();}catch(SQLException sqle){}
    }
}
