package com.jxdedu.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class LoginFilter implements Filter{
    private Logger logger = Logger.getLogger(LoginFilter.class.getName());

    @Override
    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest)request;
        logger.debug("会话id:" + req.getSession().getId());
        if (check(req)){
            logger.debug("放行");
            chain.doFilter(request, response);
        }else {
            logger.debug("验证失败,重定向到登录页面.");
            //request.getRequestDispatcher("login.do").forward(request, response);

            ((HttpServletResponse) response).sendRedirect(req.getContextPath() + "/login.do");
        }
    }
    private boolean check(HttpServletRequest request){
        String path = request.getServletPath();
        HttpSession session = request.getSession();
        logger.debug("会话id:" + session.getId());
        String userName = (String)session.getAttribute("username");
        // js,img,css 目录下的文件放行
        String regex = "/?((js|img|css)/.*|checkUserName.do|checkLogin.do|login.do|login.jsp)"; 
        
        logger.debug("拦截到请求:" + path +",凭证:" + userName);
        return (path.matches(regex) || userName != null );
    }

    @Override
    public void init(FilterConfig arg0) throws ServletException {
    }

}
