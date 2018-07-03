
package com.jxdedu.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.UserBiz;
import com.jxdedu.dao.UserDao;
import com.jxdedu.entity.User;

@Service("userBiz")
public class UserBizImpl implements UserBiz {
    @Autowired
    private UserDao dao;
    
    @Override
    public boolean isValid(String loginName, String loginPassword) {
        // 如果登录名或登录密码为 null, 登录失败
        if (loginName == null || loginPassword == null) return false;
        
        // 将登录信息封装
        User loginUser = new User();
        loginUser.setPwd(loginPassword);
        loginUser.setUserName(loginName);
        
        // 据此查询数据库
        User user = dao.getUserByNameAndPassword(loginUser);
        
        return (user != null    
                && !"禁用".equals(user.getFlag()));
    }

}

