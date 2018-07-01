package com.jxdedu.entity;

/**
 * 班级表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class ClassDate {
	private int classId; // 班级id
	private String className; // 班级名称

	public ClassDate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ClassDate(int classId, String className) {
		super();
		this.classId = classId;
		this.className = className;
	}

	public int getClassId() {
		return classId;
	}

	public void setClassId(int classId) {
		this.classId = classId;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

}
