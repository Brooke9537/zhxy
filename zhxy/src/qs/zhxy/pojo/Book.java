package qs.zhxy.pojo;

import java.util.Date;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

public class Book {
	
	private  String BookId;
	private  String BookName;
	private  String isborrow;
	


	public Book() {}

	public Book(String BookId,String BookName,String isborrow){
		this.BookId = BookId;
		this.BookName = BookName;
		this.isborrow = isborrow;
	}
	

	public String getBookId() {
		return BookId;
	}

	public void setBookId(String BookId) {
		this.BookId = BookId;
	}

	public String getBookName() {
		return BookName;
	}

	public void setBookName(String BookName) {
		this.BookName = BookName;
	}

	public String getisborrow() {
		return isborrow;
	}

	public void setisborrow(String isborrow) {
		this.isborrow = isborrow;
	}	
	
}
