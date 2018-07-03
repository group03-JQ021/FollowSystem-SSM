package com.jxdedu.entity;

/**
 * 课程表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class Course {
	private int courseId;// 课程id
	private String courseName;// 课程名称
	private String courseState;// 课程状态

	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Course(int courseId, String courseName, String courseState) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseState = courseState;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public String getCourseState() {
		return courseState;
	}

	public void setCourseState(String courseState) {
		this.courseState = courseState;
	}

	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName + ", courseState=" + courseState + "]";
	}

}
