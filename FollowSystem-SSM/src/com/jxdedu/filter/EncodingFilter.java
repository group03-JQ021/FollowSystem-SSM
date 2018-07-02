package com.jxdedu.filter;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.log4j.Logger;

/**
 * 编码过滤器. 只过滤通过 POST 和 GET 两种方式提交的请求的编码.
 * 三个相关配置参数:
 *  postSrcEncoding   应设置为 POST 请求的编码方式, 默认值 "UTF-8";
 *  serverUriEncoding 应设置为 Tomcat 服务器默认的对 GET 方式 URI 解码时使用的编码, 默认为 iso-8859-1";
 *  realUriEncoding   应设置为 GET 方式提交的请求的实际编码方式, 默认为 "UTF-8";
 * 这三个参数都是可选的,当省略时,这三个参数将取默认值.
 * @ClassName EncodingFilter
 * @author 陈希展 
 * @date 2018年6月22日
 */
public class EncodingFilter implements Filter{
    private String postSrcEncoding="UTF-8";
    private String serverUriEncoding = "iso-8859-1";
    private String realUriEncoding = "UTF-8";
    private static Logger logger = Logger.getLogger(EncodingFilter.class.getName());
    
    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        if (logger.isDebugEnabled()){
            logger.debug("拦截到请求,方式为:"+req.getMethod());
        }
        
        if ("POST".equals(req.getMethod())){
            
            req.setCharacterEncoding(postSrcEncoding);
            logger.debug("设置POST请求解码格式为"+postSrcEncoding);
            chain.doFilter(request, response);
            
        }else if("GET".equals(req.getMethod())){
            chain.doFilter(new EncodingWrapper(req), response);
        }
    }
    
    class EncodingWrapper extends HttpServletRequestWrapper{
        public EncodingWrapper(HttpServletRequest req){
            super(req);
        }
        
        @Override
        public String  getParameter(String name){
            String value = super.getParameter(name);

            logger.debug("参数转码:源:"+name+":"+value);
            if (value != null 
                    && !serverUriEncoding.equals(realUriEncoding)){
                try {
                    value = new String(value.getBytes(serverUriEncoding), realUriEncoding);
                    logger.debug("转码后:"+value);                    
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
            return value;
        }
        
    }

    @Override
    public void init(FilterConfig config) throws ServletException {
        String str = config.getInitParameter("postSrcEncoding");
        if (str != null) postSrcEncoding = str;
        str =  config.getInitParameter("serverUriEncoding");
        if (str != null) serverUriEncoding = str;
        str =  config.getInitParameter("realUriEncoding");
        if (str != null) realUriEncoding = str;
        
        logger.info("编码过滤器初始化:postSrcEncoding"  + postSrcEncoding 
                + ":serverUriEncoding=" + serverUriEncoding
                + ":realUriEncoding=" + realUriEncoding);
        
    }

}