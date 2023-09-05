package org.lanqiao.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author chenrui
 * @version 1.0
 * @data 2023/8/29 下午3:56
 */
public class loginInterceptor implements HandlerInterceptor {
    /**
     * 拦截器，前置拦截器
     * @param request
     * @param response
     * @param handler
     * @return true 放行，false 拦截
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println(request.getRequestURI());
        if(request.getSession().getAttribute("admin") == null){
            System.out.println(request.getSession().getAttribute("admin"));
            response.sendRedirect("/login.jsp");
           return false;
       }
        return true;
    }


}
