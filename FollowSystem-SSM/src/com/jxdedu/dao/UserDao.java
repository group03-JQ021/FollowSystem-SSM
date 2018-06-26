package com.jxdedu.dao;

import com.jxdedu.entity.User;

public interface UserDao {

    public User getUserByNameAndPassword(User user);
}
