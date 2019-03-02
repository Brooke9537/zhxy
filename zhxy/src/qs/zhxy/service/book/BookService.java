package qs.zhxy.service.book;

import java.util.List;

import qs.zhxy.pojo.Book;

public interface BookService {
	
	public List<Book> getBookList(String queryBookName,int currentPageNo, int pageSize);
	
	public int getBookCount(String queryBookName);
	
}
