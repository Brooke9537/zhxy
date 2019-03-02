package qs.zhxy.service.book;

import java.sql.Connection;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import qs.zhxy.dao.BaseDao;
import qs.zhxy.dao.book.BookDao;
import qs.zhxy.pojo.Book;


@Service
public class BookServiceImpl implements BookService{
	@Resource
	private BookDao bookDao;
	
	@Override
	public List<Book> getBookList(String queryBookName, int currentPageNo, int pageSize) {
		// TODO Auto-generated method stub
				Connection connection = null;
				List<Book> bookList = null;
				System.out.println("queryBookName ---- > " + queryBookName);
				System.out.println("currentPageNo ---- > " + currentPageNo);
				System.out.println("pageSize ---- > " + pageSize);
				try {
					connection = BaseDao.getConnection();
					bookList = bookDao.getBookList(connection, queryBookName,currentPageNo,pageSize);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					BaseDao.closeResource(connection, null, null);
				}
				return bookList;
	}

	@Override
	public int getBookCount(String queryBookName) {

		// TODO Auto-generated method stub
				Connection connection = null;
				int count = 0;
				System.out.println("queryBookName ---- > " + queryBookName);
//				System.out.println("queryRoleId ---- > " + queryRoleId);
				try {
					connection = BaseDao.getConnection();
					count = bookDao.getBookCount(connection, queryBookName);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally{
					BaseDao.closeResource(connection, null, null);
				}
				return count;
	}
	
}
