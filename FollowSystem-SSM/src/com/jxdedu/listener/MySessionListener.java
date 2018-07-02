package com.jxdedu.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.log4j.Logger;

public class MySessionListener implements HttpSessionListener {
    Logger logger = Logger.getLogger("自定义会话监听器");
    @Override
    public void sessionCreated(HttpSessionEvent e) {
        logger.info("监听到会话创建:" + e.getSession().getId());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent e) {
        logger.info("监听到会话销毁:" + e.getSession().getId());
    }

}
