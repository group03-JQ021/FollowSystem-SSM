package com.jxdedu.entity;

/**
 * 成绩表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class Score {
	private int stuId;// 学生id
	private int courseId;// 课程id
	private int score;// 成绩

	private Student student;// 学生表
	private Course course;// 课程表

	public Score() {
		super();
	}

	public Score(int stuId, int courseId, int score, Student student, Course course) {
		super();
		this.stuId = stuId;
		this.courseId = courseId;
		this.score = score;
		this.student = student;
		this.course = course;
	}

	public int getStuId() {
		return stuId;
	}

	public void setStuId(int stuId) {
		this.stuId = stuId;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Score [stuId=" + stuId + ", courseId=" + courseId + ", score=" + score + ", student=" + student
				+ ", course=" + course + "]";
	}

}
