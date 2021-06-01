package board.mboard.vo;

public class JavaVo {
	private int j_number ;
	private String j_username;
	private String j_subject;
	private String j_content;
	private String j_regdate;
	private int j_readcount;
	public JavaVo(int j_number, String j_username, String j_subject, String j_content, String j_regdate,
			int j_readcount) {
		this.j_number = j_number;
		this.j_username = j_username;
		this.j_subject = j_subject;
		this.j_content = j_content;
		this.j_regdate = j_regdate;
		this.j_readcount = j_readcount;
	}
	public JavaVo() {
	}
	public int getJ_number() {
		return j_number;
	}
	public void setJ_number(int j_number) {
		this.j_number = j_number;
	}
	public String getJ_username() {
		return j_username;
	}
	public void setJ_username(String j_username) {
		this.j_username = j_username;
	}
	public String getJ_subject() {
		return j_subject;
	}
	public void setJ_subject(String j_subject) {
		this.j_subject = j_subject;
	}
	public String getJ_content() {
		return j_content;
	}
	public void setJ_content(String j_content) {
		this.j_content = j_content;
	}
	public String getJ_regdate() {
		return j_regdate;
	}
	public void setJ_regdate(String j_regdate) {
		this.j_regdate = j_regdate;
	}
	public int getJ_readcount() {
		return j_readcount;
	}
	public void setJ_readcount(int j_readcount) {
		this.j_readcount = j_readcount;
	}
	@Override
	public String toString() {
		return "JavaVo [j_number=" + j_number + ", j_username=" + j_username + ", j_subject=" + j_subject
				+ ", j_content=" + j_content + ", j_regdate=" + j_regdate + ", j_readcount=" + j_readcount + "]";
	}
	public String toXML() {
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\" ?>\r\n" + 
				"<search>\r\n" + 
				"	<j_number>"+ this.j_number +"</j_number>\r\n" + 
				"	<j_username>"+ this.j_username +"</j_username>\r\n" + 
				"	<j_subject>"+ this.j_subject +"</j_subject>\r\n" + 
				"	<j_content>"+ this.j_content +"</j_content>\r\n" + 
				"	<j_regdate>"+ this.j_regdate +"</j_regdate>\r\n" + 
				"	<j_readcount>"+ this.j_readcount +"</j_readcount>\r\n" + 
				"</search>";
		return xml;
	}
	
	
}
