package qs.zhxy.dao.user;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mysql.jdbc.StringUtils;

import qs.zhxy.dao.BaseDao;
import qs.zhxy.pojo.User;

/**
 * dao层抛出异常，让service层去捕获处理
 * @author Administrator
 *
 */
@Repository
public class UserDaoImpl implements UserDao{

	@Override
	public int add(Connection connection, User user) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		int updateRows = 0;
		if(null != connection){
			String sql = "update zhxy_user set userName=?," +
					"gender=?,grade=?,major=?,Sclass=?,telephone=?,position=?,area=?,worktime=?,isfree=?,times=?,roleId=? where userId=?" +
					"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {user.getUserId(),user.getUserName(),
					user.getRoleId(),user.getGender(),user.getGrade(),user.getMajor(),user.getSclass(),
					user.getTelephone(),user.getPosition(),user.getArea(),user.getWorktime(),user.getIsfree(),
					user.getTimes(),user.getRoleId()};
			updateRows = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return updateRows;
	}

	@Override
	public User getLoginUser(Connection connection, String userId)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		User user = null;
		if(null != connection){
			String sql = "select * from zhxy_user where userId=?";
			Object[] params = {userId};
			rs = BaseDao.execute(connection, pstm, rs, sql, params);
			if(rs.next()){
				user = new User();
				
				user.setUserId(rs.getString("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setGender(rs.getString("gender"));
				user.setGrade(rs.getString("grade"));
				user.setMajor(rs.getString("major"));
				user.setSclass(rs.getString("Sclass"));
				user.setTelephone(rs.getString("telephone"));
				user.setPosition(rs.getString("position"));
				user.setArea(rs.getString("area"));
				user.setWorktime(rs.getDate("worktime"));
				user.setIsfree(rs.getString("isfree"));
				user.setTimes(rs.getString("times"));
				user.setRoleId(rs.getInt("roleId"));
				
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return user;
	}

	@Override
	public List<User> getUserList(Connection connection, String userName,int currentPageNo, int pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<User> userList = new ArrayList<User>();
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select u.* ,r.roleName  from zhxy_user u ,zhxy_role r where u.roleId = r.id");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(userName)){
				sql.append(" u.userName like ?");
				list.add("%"+userName+"%");
			}
			
			sql.append(" order by userId DESC limit ?,?");
			currentPageNo = (currentPageNo-1)*pageSize;
			list.add(currentPageNo);
			list.add(pageSize);
			
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			while(rs.next()){
				User _user = new User();
				_user.setUserId(rs.getString("userId"));
				_user.setUserName(rs.getString("userName"));
				_user.setGender(rs.getString("gender"));
				_user.setGrade(rs.getString("grade"));
				_user.setSclass(rs.getString("Sclass"));
				_user.setTelephone(rs.getString("telephone"));
				_user.setRoleName(rs.getString("roleName"));
				userList.add(_user);
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return userList;
	}

	@Override
	public int deleteUserById(Connection connection,Integer delId) throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		int flag = 0;
		if(null != connection){
			String sql = "delete from zhxy_user where userId=?";
			Object[] params = {delId};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

	@Override
	public User getUserById(Connection connection, String userId) throws Exception {
		// TODO Auto-generated method stub
		User user = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		if(null != connection){
			String sql = "select u.*,r.roleName  from zhxy_user u,zhxy_role r where u.userId=? and u.roleId = r.id";
			Object[] params = {userId};
			rs = BaseDao.execute(connection, pstm, rs, sql, params);
			if(rs.next()){
				user = new User();
				
				user.setUserId(rs.getString("userId"));
				user.setUserName(rs.getString("userName"));
				user.setUserPassword(rs.getString("userPassword"));
				user.setGender(rs.getString("gender"));
				user.setGrade(rs.getString("grade"));
				user.setMajor(rs.getString("major"));
				user.setSclass(rs.getString("Sclass"));
				user.setTelephone(rs.getString("telephone"));
				user.setPosition(rs.getString("position"));
				user.setArea(rs.getString("area"));
				user.setWorktime(rs.getDate("worktime"));
				user.setIsfree(rs.getString("isfree"));
				user.setTimes(rs.getString("times"));
				user.setRoleId(rs.getInt("roleId"));
				user.setRoleName(rs.getString("roleName"));
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return user;
	}

//	@Override
//	public int modify(Connection connection, User user) throws Exception {
//		// TODO Auto-generated method stub
//		int flag = 0;
//		PreparedStatement pstm = null;
//		if(null != connection){
//			String sql = "update smbms_user set userName=?,"+
//				"gender=?,birthday=?,phone=?,address=?,userRole=?,modifyBy=?,modifyDate=? where userId = ? ";
//			Object[] params = {user.getUserName(),user.getGender(),user.getBirthday(),
//					user.getPhone(),user.getAddress(),user.getRoleId(),user.getModifyBy(),
//					user.getModifyDate().getClass(),user.getUserId()};
//			flag = BaseDao.execute(connection, pstm, sql, params);
//			BaseDao.closeResource(null, pstm, null);
//		}
//		return flag;
//	}

	@Override
	public int updatePwd(Connection connection, int userId, String pwd)
			throws Exception {
		// TODO Auto-generated method stub
		int flag = 0;
		PreparedStatement pstm = null;
		if(connection != null){
			String sql = "update zhxy_user set userPassword= ? where userId = ?";
			Object[] params = {pwd,userId};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}

	@Override
	public int getUserCount(Connection connection, String userName)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select count(1) as count from zhxy_user u,zhxy_role r where u.roleId = r.id");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(userName)){
				sql.append(" and u.userName like ?");
				list.add("%"+userName+"%");
			}
//			if(roleId > 0){
//				sql.append(" and u.roleId = ?");
//				list.add(roleId);
//			}
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			if(rs.next()){
				count = rs.getInt("count");
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return count;
	}

	@Override
	public int modify(Connection connection, User user) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
