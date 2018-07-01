package com.jxdedu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;

import com.jxdedu.entity.User;

public interface UserDao {

    /**
     * 根据用户名和密码获取用户
     * @param user
     * @return 具有给定用户名和密码的用户对象; 或 null
     */
    @Select("select * from users where userName=#{userName} and pwd=#{pwd}")
    public User getUserByNameAndPassword(User user);
    
    /* 分页查询相关功能 */
    /**
     * 获取数据库中记录总数
     */
    public int getTotalCount();
    /**
     * 获取指定区间内的用户数据
     * @return
     */
    public List<User> getByRange(Map<String,Integer> range);
    /* end--分页查询相关功能 */
    
    @Select("select count(*) from users where userName=#{userName}")
    public int countUserName(String userName);
    
}
