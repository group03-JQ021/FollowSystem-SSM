package com.jxdedu.entity;

/**
 * 用户角色分配表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class UserRoleRelationship {
	private int userid; // 用户id
	private int roleid; // 角色id
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRoleid() {
		return roleid;
	}
	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}
}
