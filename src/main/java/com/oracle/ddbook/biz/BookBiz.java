package com.oracle.ddbook.biz;

import java.util.List;

import com.oracle.ddbook.model.Book;

public interface BookBiz {

	boolean booksave(Book booktype);

	List<Book> findAll(int currontPage, String name, int sid);

	int pagerow(String name, int sid);

	int deldata(int id);


    Book findbookByid(int id);

    boolean bookup(Book booktype);

}
