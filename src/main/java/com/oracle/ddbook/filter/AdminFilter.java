package com.oracle.ddbook.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AdminFilter",urlPatterns = "/*")
public class AdminFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request= (HttpServletRequest) req;
        HttpServletResponse response= (HttpServletResponse) resp;
        //当登录后登录页面就不要拦截了，但可能就会导致css不起作用所以就要把css排除
        if (request.getRequestURI().endsWith("/login.jsp")||request.getRequestURI().contains("/bower_components/")||request.getRequestURI().endsWith("/login")||request.getRequestURI().endsWith("vcode.png")){
            chain.doFilter(req, resp);
            return;
        }
        //管理员如果不登录就无法看到各个页面
        if (request.getSession().getAttribute("hasLogined")==null||!(boolean) request.getSession().getAttribute("hasLogined")){
            response.sendRedirect("login.jsp");
            return;
        }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
