package member;

import java.sql.Timestamp;

public class MemberBean {
	private String id;
	private String pass;
	private String name;
	private String email;
	private String sample4_postcode;
	private String sample4_roadAddress ;
	private String sample4_jibunAddress;
	private Timestamp reg_date;
	
	public String getSample4_postcode() {
		return sample4_postcode;
	}
	public void setSample4_postcode(String sample4_postcode) {
		this.sample4_postcode = sample4_postcode;
	}
	public String getSample4_roadAddress() {
		return sample4_roadAddress;
	}
	public void setSample4_roadAddress(String sample4_roadAddress) {
		this.sample4_roadAddress = sample4_roadAddress;
	}
	public String getSample4_jibunAddress() {
		return sample4_jibunAddress;
	}
	public void setSample4_jibunAddress(String sample4_jibunAddress) {
		this.sample4_jibunAddress = sample4_jibunAddress;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
