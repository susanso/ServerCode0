package data.dto;

import java.sql.Timestamp;

public class AISM_User_CreateMusic_History_DTO {
	private int numbering;
	private Timestamp nowtime;
	private String composemode;
	private String contents;
	private int ChangeInstimes;
	private int regeneratetimes;
	private int isregister;
	private int isdownloadint;
	
	public AISM_User_CreateMusic_History_DTO() {
		// TODO Auto-generated constructor stub
	}
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
	public String getComposemode() {
		return composemode;
	}
	public void setComposemode(String composemode) {
		this.composemode = composemode;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getChangeInstimes() {
		return ChangeInstimes;
	}
	public void setChangeInstimes(int changeInstimes) {
		ChangeInstimes = changeInstimes;
	}
	public int getRegeneratetimes() {
		return regeneratetimes;
	}
	public void setRegeneratetimes(int regeneratetimes) {
		this.regeneratetimes = regeneratetimes;
	}
	public int getIsregister() {
		return isregister;
	}
	public void setIsregister(int isregister) {
		this.isregister = isregister;
	}
	public int getIsdownloadint() {
		return isdownloadint;
	}
	public void setIsdownloadint(int isdownloadint) {
		this.isdownloadint = isdownloadint;
	}
	
}
