package com.jxdedu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class LoginFilter implements Filter{

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        if (req.getSession().getAttribute("name") != null){
            chain.doFilter(request, response);
        }else {
            request.getRequestDispatcher("login.do").forward(request, response);
        }
    }
    
    

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

}
