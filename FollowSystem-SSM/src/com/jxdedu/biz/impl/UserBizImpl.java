package com.jxdedu.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.UserBiz;
import com.jxdedu.dao.UserDao;
import com.jxdedu.entity.User;

@Service("userBiz")
public class UserBizImpl implements UserBiz {
    @Autowired
    private UserDao dao;
    
    private Logger logger = Logger.getLogger(UserBiz.class.getName());
    
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

    @Override
    public int getTotalCount() {
        return dao.getTotalCount();
    }

    @Override
    public List<User> getByRange(int lowerBound,int upperBound){
        if (lowerBound < upperBound){
            logger.warn("检测到非法分页查询区间:[" + lowerBound + "," + upperBound + ")");
        }
        Map<String,Integer> range = new HashMap<String,Integer>();
        range.put("lowerBound", lowerBound);
        range.put("upperBound", upperBound);
        return dao.getByRange(range);
    }

}
