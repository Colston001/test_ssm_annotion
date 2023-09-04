package org.lanqiao.filter;


import javax.servlet.*;
import java.io.IOException;

//@WebFilter("*.do")
public class EncodingFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        servletRequest.setCharacterEncoding("utf-8");
        servletResponse.setCharacterEncoding("utf-8");
//        System.out.println("执行了过滤器1111");

        // 过滤器放行给servlet或jsp 让其处理数据,若不写该方法则会把请求拦截在该页面，servlet或jsp的内容不会显示
        filterChain.doFilter(servletRequest, servletResponse);
        // servlet 或 jsp 处理完后执行该代码
        servletResponse.setContentType("text/html;charset=utf-8");
//        System.out.println("执行了过滤器2222");
    }

    @Override
    public void destroy() {

    }

}
