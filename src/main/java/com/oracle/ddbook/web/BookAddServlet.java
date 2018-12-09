package com.oracle.ddbook.web;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oracle.ddbook.biz.impl.BookBizlmpl;
import com.oracle.ddbook.model.Book;
import com.oracle.ddbook.util.MyBeanUtils;
import com.oracle.ddbook.biz.BookBiz;
import com.oracle.ddbook.util.StringEscapeUtils;

/**
 * Servlet implementation class BookAddServlet
 */
@WebServlet("/bookAdd")
@MultipartConfig
public class BookAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BookAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Book booktype=new Book();
		MyBeanUtils.populate(booktype, request.getParameterMap(), "yyyy-mm-dd");
		String newfile = null;
		Part part = request.getPart("photo");
		if (part.getHeader("Content-Disposition").contains("; filename=")) {

			if (part.getSubmittedFileName() != null && !part.getSubmittedFileName().equals("")) {

				String ext = part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf(".") + 1);

				newfile = UUID.randomUUID() + "." + ext;
				part.write(request.getServletContext().getRealPath("/upload/" + newfile));
			}
		}
		booktype.setPhoto(newfile);
		booktype.setPescr(StringEscapeUtils.htmlEncode(booktype.getPescr()));
		BookBiz bookBiz = new BookBizlmpl();
		boolean ret = bookBiz.booksave(booktype);
		if (ret) {
			response.sendRedirect("bookList");
		} else {
			request.setAttribute("booktype", booktype);
			request.getRequestDispatcher("bookAdd.jsp").forward(request, response);
		}
	}

}
