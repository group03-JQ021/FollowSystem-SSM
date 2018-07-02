package com.jxdedu.entity;

public class Roletable {
	private int roleId;//角色id
	private String roleName;//角色名称
	private String roleType;//角色类型
	private String note;//备注
	private String flag;//标识
	private String roleUserType;//用户角色类型
	private UserRoleRelationship  userRole;//用户角色分配表
	public int getRoleId() {
		return roleId;
	}
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getRoleType() {
		return roleType;
	}
	public void setRoleType(String roleType) {
		this.roleType = roleType;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getRoleUserType() {
		return roleUserType;
	}
	public void setRoleUserType(String roleUserType) {
		this.roleUserType = roleUserType;
	}
	public UserRoleRelationship getUserRole() {
		return userRole;
	}
	public void setUserRole(UserRoleRelationship userRole) {
		this.userRole = userRole;
	}

}
