package event.vo;

import java.sql.Date;

public class EventVO {
	private int eventnum;
	private String eventtitle;
	private String eventcontent;
	private String eventimg1;
	private String eventimg2;
	private String eventday;
	private Date eventdate;

	public EventVO() {
		
	}

	public EventVO(int eventnum, String eventtitle, String eventcontent, String eventimg1, String eventimg2,
			String eventday, Date eventdate) {
		super();
		this.eventnum = eventnum;
		this.eventtitle = eventtitle;
		this.eventcontent = eventcontent;
		this.eventimg1 = eventimg1;
		this.eventimg2 = eventimg2;
		this.eventday = eventday;
		this.eventdate = eventdate;
	}

	public int getEventnum() {
		return eventnum;
	}

	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}

	public String getEventtitle() {
		return eventtitle;
	}

	public void setEventtitle(String eventtitle) {
		this.eventtitle = eventtitle;
	}

	public String getEventcontent() {
		return eventcontent;
	}

	public void setEventcontent(String eventcontent) {
		this.eventcontent = eventcontent;
	}

	public String getEventimg1() {
		return eventimg1;
	}

	public void setEventimg1(String eventimg1) {
		this.eventimg1 = eventimg1;
	}

	public String getEventimg2() {
		return eventimg2;
	}

	public void setEventimg2(String eventimg2) {
		this.eventimg2 = eventimg2;
	}

	public String getEventday() {
		return eventday;
	}

	public void setEventday(String eventday) {
		this.eventday = eventday;
	}

	public Date getEventdate() {
		return eventdate;
	}

	public void setEventdate(Date eventdate) {
		this.eventdate = eventdate;
	}

	
	@Override
	public String toString() {
		return "EventVO [eventnum=" + eventnum + ", eventtitle=" + eventtitle + ", eventcontent=" + eventcontent
				+ ", eventimg1=" + eventimg1 + ", eventimg2=" + eventimg2 + ", eventday=" + eventday + ", eventdate="
				+ eventdate + "]";
	}

	
	
	
}
