package qs.zhxy.dao.datestudent;
import java.sql.Connection;


import java.util.List;

import qs.zhxy.pojo.Book;
import qs.zhxy.pojo.Datestudent;


public interface DatestudentDao {

	public List<Datestudent> getdatestudentList(Connection connection,String stuId,int currentPageNo, int pageSize)throws Exception;
	public int dating(Connection connection,Datestudent datestudent)throws Exception;
//	public int getdatestudentCount(Connection connection,String stuId)throws Exception;
}
