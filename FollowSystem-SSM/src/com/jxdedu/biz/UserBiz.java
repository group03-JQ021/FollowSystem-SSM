package com.jxdedu.biz;

import com.jxdedu.entity.User;

public interface UserBiz {
    public boolean isValid(String loginName, String loginPassword);
    
    
    int getUserByName(String username);
}
