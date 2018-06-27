package com.jxdedu.entity;

/**
 * 部门表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class Dept {
	private int deptId; // 部门id
	private String deptName; // 部门名称
	private String deptAddress; // 部门地址

	public Dept() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Dept(int deptId, String deptName, String deptAddress) {
		super();
		this.deptId = deptId;
		this.deptName = deptName;
		this.deptAddress = deptAddress;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getDeptAddress() {
		return deptAddress;
	}

	public void setDeptAddress(String deptAddress) {
		this.deptAddress = deptAddress;
	}

}
