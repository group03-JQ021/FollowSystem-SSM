package com.jxdedu.entity;

import java.util.Date;

/**
 * 实体类,用户
 * @ClassName User
 * @author 陈希展 
 * @date 2018年6月19日
 */
public class User {
    private int userId; //  用户id, 主键
    private String userName;   //   登录名
    private String pwd;    //   登录密码
    private String telephone;  //   固定电话号码
    private String phone;  //   手机号码
    private String email;  //   电子邮箱
    private String note;   //   备注
    private String flag;   //   标识, 用户是否激活
    private Date loginTime;  // 登录时间
    private int deptno; //  用户所在部门的部门ID, 外键
    /**
     * @return the userId
     */
    public int getUserId() {
        return userId;
    }
    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }
    /**
     * @return the pwd
     */
    public String getPwd() {
        return pwd;
    }
    /**
     * @return the telephone
     */
    public String getTelephone() {
        return telephone;
    }
    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }
    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }
    /**
     * @return the note
     */
    public String getNote() {
        return note;
    }
    /**
     * @return the flag
     */
    public String getFlag() {
        return flag;
    }
    /**
     * @return the loginTime
     */
    public Date getLoginTime() {
        return loginTime;
    }
    /**
     * @return the deptno
     */
    public int getDeptno() {
        return deptno;
    }
    /**
     * @param userId the userId to set
     */
    public void setUserId(int userId) {
        this.userId = userId;
    }
    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }
    /**
     * @param pwd the pwd to set
     */
    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    /**
     * @param telephone the telephone to set
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }
    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }
    /**
     * @param note the note to set
     */
    public void setNote(String note) {
        this.note = note;
    }
    /**
     * @param flag the flag to set
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }
    /**
     * @param loginTime the loginTime to set
     */
    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }
    /**
     * @param deptno the deptno to set
     */
    public void setDeptno(int deptno) {
        this.deptno = deptno;
    }
    public User() {
        super();
    }
}
