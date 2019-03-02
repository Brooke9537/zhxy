package qs.zhxy.dao.datestudent;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mysql.jdbc.StringUtils;

import qs.zhxy.dao.BaseDao;
import qs.zhxy.pojo.Datestudent;
import qs.zhxy.pojo.User;

@Repository
public  class DatestudentDaoImpl  implements DatestudentDao{


	@Override
	public  int dating(Connection connection, Datestudent datestudent)throws Exception{
		int flag = 0;
		PreparedStatement pstm = null;
		if(null != connection){
			String sql = "update zhxy_dating set stuName=?,"+
				"gender=?,major=?,telephone=?,time=? where stuId = ? ";
			Object[] params = {datestudent.getStuName(),datestudent.getGender(),datestudent.getMajor(),
					datestudent.getTelephone(),datestudent.getTime(),datestudent.getStuId()};
			flag = BaseDao.execute(connection, pstm, sql, params);
			BaseDao.closeResource(null, pstm, null);
		}
		return flag;
	}
	
	@Override
	public List<Datestudent> getdatestudentList(Connection connection, String stuId,int currentPageNo, int pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Datestudent> datestudentList = new ArrayList<Datestudent>();
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select * from zhxy_dating ");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(stuId)){
				sql.append(" stuId like ?");
				list.add("%"+stuId+"%");
			}
			
			sql.append(" order by userId DESC limit ?,?");
			currentPageNo = (currentPageNo-1)*pageSize;
			list.add(currentPageNo);
			list.add(pageSize);
			
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			while(rs.next()){
				Datestudent _datestudent = new Datestudent();
				_datestudent.setStuId(rs.getString("stuId"));
				_datestudent.setStuName(rs.getString("stuName"));
				_datestudent.setGender(rs.getString("gender"));
				_datestudent.setMajor(rs.getString("major"));
				_datestudent.setTelephone(rs.getString("telephone"));
				_datestudent.setTime(rs.getDate("time"));
				datestudentList.add(_datestudent);
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return datestudentList;
	}
	
	
	
}
