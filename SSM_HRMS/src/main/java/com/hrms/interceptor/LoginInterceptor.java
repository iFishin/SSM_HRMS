package com.hrms.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        List<String> blockedPaths = Arrays.asList("/hrms/dologin", "/update/change-email", "/login");
        String loginUri = request.getContextPath() + "/";
        HttpSession session = request.getSession();

        if (session.getAttribute("user") == null && !blockedPaths.contains(request.getRequestURI())) {
            // 如果请求的URI为根目录，则直接通过拦截器，不进行重定向
            if (request.getRequestURI().equals(loginUri)) {
                return true;
            }
            // 如果请求头中包含 X-Requested-With 字段，并且其值为 XMLHttpRequest，则表示该请求为AJAX请求，不进行重定向
            String requestedWithHeader = request.getHeader("X-Requested-With");
            if ("XMLHttpRequest".equals(requestedWithHeader)) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 设置返回状态码为401（未授权）
                return false;
            }

            response.sendRedirect(loginUri); // 未登录，重定向到登录页面
            return false; // 中断请求继续执行
        }
        return true; // 已登录，请求继续执行
    }


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {
        // 不做任何处理
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 不做任何处理
    }
}
