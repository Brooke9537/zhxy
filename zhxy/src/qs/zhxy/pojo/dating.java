package qs.zhxy.pojo;

public class dating {
	private int dateid;
	private String stuId;
	private String stuName;
	private String telephone;
	private String date;
	private String time;
	private String statue;
	
	
	public dating() {}
	
	public dating(String stuid,String stuName,String telephone,String date,String time,String statue) {
		this.stuId = stuid;
		this.stuName = stuName;
		this.telephone = telephone;
		this.date = date;
		this.time = time;
		this.statue = statue;
	}
	
	public String getStuId() {
		return stuId;
	}
	public void setStuId(String stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getStatue() {
		return statue;
	}
	public void setStatue(String statue) {
		this.statue = statue;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public int getDateid() {
		return dateid;
	}

	public void setDateid(int dateid) {
		this.dateid = dateid;
	}





}
