package com.oracle.ddbook.biz.impl;

import java.util.List;

import com.oracle.ddbook.model.Book;
import com.oracle.ddbook.biz.BookBiz;
import com.oracle.ddbook.dao.BookDao;
import com.oracle.ddbook.dao.impl.BookDaoJdbcImpl;

public class BookBizlmpl implements BookBiz {

	@Override
	public boolean booksave(Book booktype) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.booksave(booktype);
	}

	@Override
	public List<Book> findAll(int currontPage, String name, int sid) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.findAll(currontPage,name,sid);
	}

	@Override
	public int pagerow(String name,int sid) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.total(name,sid);
	}

	@Override
	public int deldata(int id) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.deldata(id);
	}

	@Override
	public Book findbookByid(int id) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.findbookByid(id);
	}

	@Override
	public boolean bookup(Book booktype) {
		BookDao bookDao=new BookDaoJdbcImpl();
		return bookDao.bookup(booktype);
	}



}
