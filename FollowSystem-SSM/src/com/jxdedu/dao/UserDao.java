package com.jxdedu.dao;

import com.jxdedu.entity.User;

public interface UserDao {

    public User getUserByNameAndPassword(User user);
    /**
     * 通过姓名得到id
     * @param username
     * @return
     */
    int getUserByName(String username);
}
