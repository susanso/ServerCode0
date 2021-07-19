package aism.data.dto;

public class AISM_User_Work_List_DTO {

	private int numbering;
	private String user;
	private String subject;
	private String createdate;
	private String composetype;
	private String songinfo1;
	private String songinfo2;
	private String albumcover;
	private String sell;
	private String price;
	
	
	public String getSell() {
		return sell;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setSell(String sell) {
		this.sell = sell;
	}

	public int getNumbering() {
		return numbering;
	}

	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public String getComposetype() {
		return composetype;
	}

	public void setComposetype(String composetype) {
		this.composetype = composetype;
	}

	public String getSonginfo1() {
		return songinfo1;
	}

	public void setSonginfo1(String songinfo1) {
		this.songinfo1 = songinfo1;
	}

	public String getSonginfo2() {
		return songinfo2;
	}

	public void setSonginfo2(String songinfo2) {
		this.songinfo2 = songinfo2;
	}

	public String getAlbumcover() {
		return albumcover;
	}

	public void setAlbumcover(String albumcover) {
		this.albumcover = albumcover;
	}

}
