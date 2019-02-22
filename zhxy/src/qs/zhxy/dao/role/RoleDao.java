package qs.zhxy.dao.role;

import java.sql.Connection;

import java.util.List;
import qs.zhxy.pojo.Role;

public interface RoleDao {
	
	public List<Role> getRoleList(Connection connection)throws Exception;

}
