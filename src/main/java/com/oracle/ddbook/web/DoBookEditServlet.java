package com.oracle.ddbook.web;

import com.oracle.ddbook.biz.impl.BookBizlmpl;
import com.oracle.ddbook.biz.BookBiz;
import com.oracle.ddbook.model.Book;
import com.oracle.ddbook.util.MyBeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "DoBookEditServlet",value = "/dobookEdit")
@MultipartConfig
public class DoBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Book booktype = new Book();
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

        BookBiz bookBiz = new BookBizlmpl();
        boolean ret = bookBiz.bookup(booktype);
        if (ret) {
            response.sendRedirect("bookList");
        } else {
            request.setAttribute("book", booktype);
            request.getRequestDispatcher("bookEdit.jsp").forward(request, response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}