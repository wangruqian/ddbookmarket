package com.oracle.ddbook.web;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.ddbook.biz.impl.BigBizImpl;
import com.oracle.ddbook.model.BigType;
import org.json.JSONArray;

import com.oracle.ddbook.biz.BigTypeBiz;

/**
 * Servlet implementation class FindAllBigbook
 */
@WebServlet("/findAllBigtype")
public class FindAllBigbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindAllBigbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	/*	BigTypeBiz bigBiz=new BigBizImpl();
		List<BigType> ls=bigBiz.findAllBigtype();
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		//把Java的List转为js的List
		pw.println("findsel("+jsonArray.toString()+")");
		pw.flush();*/
		String callback=request.getParameter("callback");
		System.out.println(callback+"-------------");
		BigTypeBiz bigBiz=new BigBizImpl();
		List<BigType> ls=bigBiz.findAllBigtype();
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		//把Java的List转为js的List
		pw.println(callback+"("+jsonArray.toString()+")");
		pw.flush();
	}

}
