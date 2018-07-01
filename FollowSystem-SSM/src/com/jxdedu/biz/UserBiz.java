package com.jxdedu.biz;

import java.util.List;
import java.util.Map;

import com.jxdedu.entity.User;

public interface UserBiz {
    /**
     * 判断给定的用户名和密码是否存在,也即判断给定登录用户名和密码是否合法.
     * @param loginName
     * @param loginPassword
     * @return
     */
    public boolean isValid(String loginName, String loginPassword);
    
    /* 分页查询相关功能 */
    /**
     * 获取数据库中记录总数
     */
    public int getTotalCount();
    /**
     * 获取指定区间内的用户数据. 上下边界: 前闭后开.
     * @return
     */
    public List<User> getByRange(int lowerBound,int upperBound);
    /* end--分页查询相关功能 */
    
    public boolean checkUserName(String userName);
}
