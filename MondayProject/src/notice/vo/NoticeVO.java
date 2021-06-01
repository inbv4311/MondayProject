package notice.vo;

import java.sql.Date;

public class NoticeVO {
	private int noticenum;
	private String adminid;
	private String noticetitle;
	private String noticecontent;
	private String imagefilename;
	private Date subdate;
	
	public NoticeVO() {}

	
	
	public int getNoticenum() {
		return noticenum;
	}

	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticecontent() {
		return noticecontent;
	}

	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}

	public String getImagefilename() {
		return imagefilename;
	}

	public void setImagefilename(String imagefilename) {
		this.imagefilename = imagefilename;
	}

	public Date getSubdate() {
		return subdate;
	}

	public void setSubdate(Date subdate) {
		this.subdate = subdate;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticenum=" + noticenum + ", adminid=" + adminid + ", noticetitle=" + noticetitle
				+ ", noticecontent=" + noticecontent + ", imagefilename=" + imagefilename + ", subdate=" + subdate
				+ "]";
	}

	

	
		
}
