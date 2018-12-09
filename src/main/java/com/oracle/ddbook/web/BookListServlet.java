package com.oracle.ddbook.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.ddbook.biz.impl.BookBizlmpl;
import com.oracle.ddbook.model.Book;
import com.oracle.ddbook.util.PageConstent;
import com.oracle.ddbook.biz.BookBiz;

/**
 * Servlet implementation class BookListServlet
 */
@WebServlet("/bookList")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      String strcurrontPage=request.getParameter("currontPage");
	      if(strcurrontPage==null) {// 如果没有告诉第几页就默认显示第一页
	    	  strcurrontPage="1";
	      }
	      int currontPage=Integer.parseInt(strcurrontPage);
	      //获取name sid
	      String name=request.getParameter("name");
	      String strsid=request.getParameter("sid")==null?"-1":request.getParameter("sid");
	      int sid=Integer.parseInt(strsid);
	      String strbid=request.getParameter("bid")==null?"-1":request.getParameter("bid");
	      int bid=Integer.parseInt(strbid);
		  BookBiz bookBiz=new BookBizlmpl();
	      List<Book> ls=bookBiz.findAll(currontPage,name,sid);
	      // 查出总行数
	      int pagerow=bookBiz.pagerow(name,sid);
	      // 算出总页数
	      int totalPage=pagerow% PageConstent.PAGE_SIZE==0?pagerow/PageConstent.PAGE_SIZE:pagerow/PageConstent.PAGE_SIZE+1;
	      // 客户端是get请求，这里就是set设置
	      request.setAttribute("currontPage", currontPage);
	      request.setAttribute("totalPage", totalPage);
	      request.setAttribute("ls", ls);
	      request.setAttribute("bid", bid);
	      request.setAttribute("sid", sid);
	      request.setAttribute("name", name);
	      // 得到数据后传到jsp
	      request.getRequestDispatcher("/bookListt.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
