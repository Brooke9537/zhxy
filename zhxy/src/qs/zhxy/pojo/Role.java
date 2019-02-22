package qs.zhxy.pojo;

import java.util.Date;

public class Role {
	
	private String userId;   //id
	private Integer roleId; //角色编码
	private String roleName; //角色名称
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	
}
