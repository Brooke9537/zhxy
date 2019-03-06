package qs.zhxy.dao.book;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.mysql.jdbc.StringUtils;

import qs.zhxy.dao.BaseDao;
import qs.zhxy.pojo.Book;
import qs.zhxy.pojo.User;

/**
 * dao层抛出异常，让service层去捕获处理
 * @author Administrator
 *
 */
@Repository
public class BookDaoImpl implements BookDao{

	@Override
	public List<Book> getBookList(Connection connection, String bookName,int currentPageNo, int pageSize)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Book> bookList = new ArrayList<Book>();
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select * from zhxy_book");
			List<Object> list = new ArrayList<Object>();
			System.out.println(bookName);
			if(!StringUtils.isNullOrEmpty(bookName)){
				sql.append(" where BookName like ?");
				list.add("%"+bookName+"%");
			}
			
			sql.append(" order by BookId DESC limit ?,?");
			currentPageNo = (currentPageNo-1)*pageSize;
			list.add(currentPageNo);
			list.add(pageSize);
			
			Object[] params = list.toArray();
			System.out.println("sql ----> " + sql.toString());
			rs = BaseDao.execute(connection, pstm, rs, sql.toString(), params);
			while(rs.next()){
				Book _book = new Book();
				_book.setBookId(rs.getString("BookId"));
				_book.setBookName(rs.getString("BookName"));
				_book.setisborrow(rs.getString("isborrow"));
				
				bookList.add(_book);
			}
			BaseDao.closeResource(null, pstm, rs);
		}
		return bookList;
	}
	
	
	@Override
	public int getBookCount(Connection connection, String BookName)
			throws Exception {
		// TODO Auto-generated method stub
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int count = 0;
		if(connection != null){
			StringBuffer sql = new StringBuffer();
			sql.append("select count(1) as count from zhxy_book");
			List<Object> list = new ArrayList<Object>();
			if(!StringUtils.isNullOrEmpty(BookName)){
				sql.append(" and BookName like ?");
				list.add("%"+BookName+"%");
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

	
}
