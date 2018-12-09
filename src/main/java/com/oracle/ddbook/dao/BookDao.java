package com.oracle.ddbook.dao;

import java.util.List;

import com.oracle.ddbook.model.Book;

public interface BookDao {


	boolean booksave(Book booktype);

	List<Book> findAll(int currontPage, String name, int sid);

	int total(String name, int sid);

	

	int deldata(int id);

    Book findbookByid(int id);

    boolean bookup(Book booktype);
}
