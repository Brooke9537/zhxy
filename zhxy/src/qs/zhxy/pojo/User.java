package qs.zhxy.pojo;

import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class User {
	
	@NotEmpty(message="学工号不能为空")
	private  String userId;
	
	@NotEmpty(message="密码不能为空")
	@Length(min=6,max=10,message="密码长度为6-10")
	private  String userPassword;
	
	@NotEmpty(message="姓名不能为空")
	private  String userName;
	
	private String gender;  //性别
	private String telephone;   //电话
	private String grade; //学生年级
	private Integer roleId;    //用户角色
	private String major;   //学院
	private String Sclass; //班级
	private String position;     //教师职位
	private String area;	//教师擅长领域
	private Date worktime;   //教师值班时间
	
	private String isfree;	//是否空闲
	
	private String times;    //教师被预约次数
	
	private String idPicPath;	//证件照路径
	
	private String workPicPath; //工作证照片路径
	private String roleName;
	
	public String getWorkPicPath() {
		return workPicPath;
	}

	public void setWorkPicPath(String workPicPath) {
		this.workPicPath = workPicPath;
	}

	public String getIdPicPath() {
		return idPicPath;
	}

	public void setIdPicPath(String idPicPath) {
		this.idPicPath = idPicPath;
	}

	public User(){}
	
	public User(String userId,String userpassword,String userName,String userPassword,
			String gender,String grade,String major,String Sclass,String telephone,
			String position,String area,Date worktime,String isfree,String times,Integer roleId){
		
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
		this.gender = gender;
		this.grade = grade;
		this.major = major;
		this.Sclass = Sclass;
		this.telephone = telephone;
		this.position = position;
		this.area = area;
		this.worktime = worktime;
		this.isfree = isfree;
		this.times = times;
		this.roleId = roleId;
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSclass() {
		return Sclass;
	}

	public void setSclass(String sclass) {
		Sclass = sclass;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public Date getWorktime() {
		return worktime;
	}

	public void setWorktime(Date worktime) {
		this.worktime = worktime;
	}

	public String getIsfree() {
		return isfree;
	}

	public void setIsfree(String isfree) {
		this.isfree = isfree;
	}

	public String getTimes() {
		return times;
	}

	public void setTimes(String times) {
		this.times = times;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	
	
}
