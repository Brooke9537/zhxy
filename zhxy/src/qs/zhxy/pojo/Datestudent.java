package qs.zhxy.pojo;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Datestudent {
	private String stuId;

	private String stuName;
	private String gender;
	private String major;
	private String telephone;
	private Date time;
	
	public Datestudent(String stuId,String stuName,String gender,String major,String telephone,Date time){
		this.stuId = stuId;
		this.stuName = stuName;
		this.gender = gender;
		this.major = major;
		this.telephone = telephone;
		this.time = time;
	}

	
	public Datestudent() {}


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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

}
