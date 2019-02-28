package qs.zhxy.service.user;

import java.util.List;


import qs.zhxy.pojo.User;

public interface UserService {
	/**
	 * 增加用户信息
	 * @param user
	 * @return
	 */
	public boolean add(User user);
	
	/**
	 * 用户登录
	 * @param userCode
	 * @param userPassword
	 * @return
	 */
	public int login(String userId,String userPassword);
	
	/**
	 * 根据条件查询用户列表
	 * @param queryUserName
	 * @param pageSize 
	 * @param queryRoleId
	 * @return
	 */
	public List<User> getUserList(String queryUserName,int currentPageNo, int pageSize);
	/**
	 * 根据条件查询用户表记录数
	 * @param queryUserName
	 * @param queryRoleId
	 * @return
	 */
	public int getUserCount(String queryUserName);
	
	/**
	 * 根据userCode查询出User
	 * @param userId
	 * @return
	 */
	public User selectUserIdExist(String userId);
	
	/**
	 * 根据ID删除user
	 * @param delId
	 * @return
	 */
	public boolean deleteUserById(Integer delId);
	
	/**
	 * 根据ID查找user
	 * @param id
	 * @return
	 */
	public User getUserByUserId(String userId);
	
	/**
	 * 修改用户信息
	 * @param user
	 * @return
	 */
	public boolean modify(User user);

	public User login_user(String userId,String userPassword);
	
	
	
}
