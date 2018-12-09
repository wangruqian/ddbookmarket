package com.oracle.ddbook.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;


import com.oracle.ddbook.biz.AdminBiz;
import com.oracle.ddbook.biz.impl.AdminBizImpl;
import com.oracle.ddbook.model.Admin;
import com.oracle.ddbook.util.MyBeanUtils;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	public LoginServlet() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//1获取参数值
		Admin admin = new Admin();
		MyBeanUtils.populate(admin, request.getParameterMap());
		String vocode=request.getParameter("vcode");
		String strvocde= (String) request.getSession().getAttribute("validateCode");
		/*if (!strvocde.equalsIgnoreCase(vocode)){
			request.setAttribute("msg","验证码错误");
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//校验
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();

		Set<ConstraintViolation<Admin>> vlaidateResult = validator.validate(admin);

		if(vlaidateResult.size()>0){
			Map<String,String> error=new HashMap<>();
			for (ConstraintViolation<Admin> cv: vlaidateResult ) {
				System.out.println(cv+"-----------");
				error.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
			request.setAttribute("error",error);
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}*/
		Map<String,String> error=new HashMap<>();
		if (!strvocde.equalsIgnoreCase(vocode)){
               error.put("vcode","验证码错误");
		}
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
		Validator validator = factory.getValidator();
		Set<ConstraintViolation<Admin>> vlaidateResult = validator.validate(admin);
		if(vlaidateResult.size()>0) {
			for (ConstraintViolation<Admin> cv : vlaidateResult) {
				System.out.println(cv + "-----------");
				error.put(cv.getPropertyPath().toString(), cv.getMessage());
			}
		}
			if (error.size() > 0) {
				request.setAttribute("error", error);
				request.setAttribute("admin", admin);
				request.getRequestDispatcher("login.jsp").forward(request, response);
				return;
			}


			//2到数据库对比
			AdminBiz adminBiz = new AdminBizImpl();
			boolean ret = adminBiz.findNameAndId(admin);
			//3根据对比结果给用户一个界面
			if (ret) {
				//session同一客户对同一个web应用连续请求
				//用session记录已经登录成功
				request.getSession().setAttribute("hasLogined", true);
				request.getRequestDispatcher("main.jsp").forward(request, response);
			} else {
				request.setAttribute("admin", admin);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}

		}

}
