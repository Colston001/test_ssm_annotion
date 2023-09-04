package org.lanqiao.filter;

import org.lanqiao.entity.Admin;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

//@WebFilter("*.jsp")
public class loginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String requestURI = request.getRequestURI();
//        Admin admin = (Admin)request.getSession().getAttribute("admin");

//        System.out.println(requestURI);
//        // 放行登录页面
//        if("/sysWeb_war_exploded/login.jsp".equals(requestURI)){
//            System.out.println("kkkk");
//            filterChain.doFilter(request,response);
//            return;
//        }
//        if(admin==null){
//            response.sendRedirect("login.jsp");
//            return;
////            request.getRequestDispatcher("login.jsp").forward(request,response);
//        }
//        filterChain.doFilter(request,response);

//        System.out.println(!requestURI.endsWith("login.jsp"));


        if(!requestURI.endsWith("login.jsp")){
            Admin admin = (Admin)request.getSession().getAttribute("admin");
            if(admin==null){
                response.sendRedirect("login.jsp");
            }
        }
        filterChain.doFilter(request,response);
    }

    @Override
    public void destroy() {

    }
}
