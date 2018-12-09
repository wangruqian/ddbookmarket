package com.oracle.ddbook.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.ddbook.biz.impl.SmallBizlmpl;
import com.oracle.ddbook.model.SmallType;
import org.json.JSONArray;

import com.oracle.ddbook.biz.SmallTypeBiz;

/**
 * Servlet implementation class FindAllsmallbook
 */
@WebServlet("/findAllsmallbook")
public class FindAllsmallbook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindAllsmallbook() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String callback=request.getParameter("callback");
		SmallTypeBiz smallBiz=new SmallBizlmpl();
		String strbid=request.getParameter("bid");
		int bid=Integer.parseInt(strbid);
		List<SmallType> ls=smallBiz.findAllsmallbook(bid);
		response.setContentType("text/javascript;charset=UTF-8");
		PrintWriter pw=response.getWriter();
		JSONArray jsonArray=new JSONArray(ls);
		//把Java的List转为js的List
		pw.println(callback+"("+jsonArray.toString()+")");
		pw.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
