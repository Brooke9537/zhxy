package qs.zhxy.dao.book;

import java.sql.Connection;

import java.util.List;

import qs.zhxy.pojo.Book;

public interface BookDao {
	
	public List<Book> getBookList(Connection connection,String BookName,int currentPageNo, int pageSize)throws Exception;

	public int getBookCount(Connection connection,String BookName)throws Exception;
	
}
