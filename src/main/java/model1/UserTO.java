package model1;

public class UserTO {
	private String ID;
	private String nickname;
	private String password;
	private String name;
	private String birth;
	private String email;
	private String address;
	private String gender;
	private String date;
	
	private String hID;
	private String hdate;
	private String chit;

	
	public String gethID() {
		return hID;
	}
	public void sethID(String hID) {
		this.hID = hID;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}
	public String getChit() {
		return chit;
	}
	public void setChit(String chit) {
		this.chit = chit;
	}
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
