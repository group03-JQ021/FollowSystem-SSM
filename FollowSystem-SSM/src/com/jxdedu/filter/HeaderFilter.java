package com.jxdedu.filter;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.jxdedu.controller.UserController;

public class HeaderFilter implements Filter{
    private Logger logger = Logger.getLogger(HeaderFilter.class.getName());
    Map<String,String> headers = new HashMap<>();
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        chain.doFilter(request, response);
        HttpServletResponse res = (HttpServletResponse)response;
        debugHeaders(res);
        setCacheHeader(res);
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
        
    }
    
    private void debugHeaders(HttpServletResponse response){
        if (!logger.isDebugEnabled()){ return;}
        Collection<String> names = response.getHeaderNames();
        logger.debug("响应头如下:");
        for (String k:names){
            for (String v:response.getHeaders(k)){
               logger.debug(k+":"+v);
            }
        }
        
    }
    private void setCacheHeader(HttpServletResponse response){
        response.setHeader("cache-control","must-revalidate, max-age=300");
        response.setHeader("Pragram","");
    }

}
