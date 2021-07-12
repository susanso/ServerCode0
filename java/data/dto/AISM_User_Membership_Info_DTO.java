package data.dto;

import java.sql.Timestamp;

public class AISM_User_Membership_Info_DTO {

//	private int numbering;
	private Timestamp nowtime;
	private String id;
	private String pwd;
	private String email;
	private int pearlmission;
	private String phone;
	private String profile;
	private String username;
	
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public AISM_User_Membership_Info_DTO() {
		// TODO Auto-generated constructor stub
	}
	public int getPearlmission() {
		return pearlmission;
	}
	public void setPearlmission(int pearlmission) {
		this.pearlmission = pearlmission;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
