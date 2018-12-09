package com.oracle.ddbook.web;

import com.oracle.ddbook.biz.impl.BookBizlmpl;
import com.oracle.ddbook.biz.impl.SmallBizlmpl;
import com.oracle.ddbook.biz.BookBiz;
import com.oracle.ddbook.biz.SmallTypeBiz;
import com.oracle.ddbook.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "toBookEditServlet",value = "/tobookEdit")
public class toBookEditServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              //获取参数
        String strid=request.getParameter("id");
        int id=Integer.parseInt(strid);
        /*String strbid=request.getParameter("bid");
        int bid=Integer.parseInt(strbid);*/
        //调业务层
        BookBiz bookBiz=new BookBizlmpl();
        Book booktype=bookBiz.findbookByid(id);
        SmallTypeBiz smallBiz=new SmallBizlmpl();//调业务层用小id调大id
        int bid=smallBiz.finfbidByid(booktype.getSid());
        //回填
        request.setAttribute("book",booktype);
        request.setAttribute("bid",bid);
        System.out.println(bid+"===========");
        request.getRequestDispatcher("bookEdit.jsp").forward(request,response);

    }
}
