package com.oracle.ddbook.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.ddbook.biz.impl.SmallBizlmpl;
import com.oracle.ddbook.model.SmallType;
import com.oracle.ddbook.util.MyBeanUtils;
import com.oracle.ddbook.biz.SmallTypeBiz;

/**
 * Servlet implementation class SmallbookAdd
 */
@WebServlet("/sa")
public class SmallbookAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SmallbookAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	SmallType smalltype=new SmallType();
	MyBeanUtils.populate(smalltype,request.getParameterMap());
	SmallTypeBiz smallbiz=new SmallBizlmpl();
	boolean ret=smallbiz.save(smalltype);
	if(ret) {
		response.sendRedirect("bookAdd.jsp");
	}else {
		request.setAttribute("smalltype", smalltype);
		request.getRequestDispatcher("smallbookAdd.jsp").forward(request, response);
	}
	}

}
