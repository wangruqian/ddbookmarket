package com.oracle.ddbook.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.ddbook.biz.BigTypeBiz;
import com.oracle.ddbook.biz.impl.BigBizImpl;

/**
 * Servlet implementation class BigbookAdd
 */
@WebServlet("/BA")
public class BigbookAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BigbookAdd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//把用户填好的大类名存到数据库
		String name=request.getParameter("name");
		System.out.println(name);
		BigTypeBiz bigBiz=new BigBizImpl();//创建业务层接口 实现类（就像上级给下级分配任务，让下级帮上级完成）
		boolean ret=bigBiz.save(name);//创建方法存内容  把名字存进数据库
		if (ret) {//如果成功了就到该页面
			//重定向
			response.sendRedirect("smallbookAdd.jsp");
		} else {
			//如果不成功还是本页面
              request.setAttribute(name,"name");//客户请求get,所以后台要设置set  回填
              request.getRequestDispatcher("bigbookAdd.jsp").forward(request, response);
		}
	}

}
