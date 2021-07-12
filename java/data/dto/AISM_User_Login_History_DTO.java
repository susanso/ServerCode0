package data.dto;

import java.sql.Timestamp;

public class AISM_User_Login_History_DTO {
	private int numbering;
	private Timestamp nowtime;
	private String id;
	public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	public Timestamp getNowtime() {
		return nowtime;
	}
	public void setNowtime(Timestamp nowtime) {
		this.nowtime = nowtime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public AISM_User_Login_History_DTO() {
		// TODO Auto-generated constructor stub
	}
}
