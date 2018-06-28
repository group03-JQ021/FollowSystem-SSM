package com.jxdedu.entity;

import java.sql.Date;
import java.util.List;

public class Student {
	private int stuId;//学生id
	private String stuName;//学生姓名
	private String sex;//性别
	private String nation;//民族
	private Date birthday;//出生日期
	private String birthPlace;//出生地
	private String marry;//婚否
	private String telephone;//电话
	private String idCard;//身份证号
	private String university;//毕业院校
	private String major;//专业
	private String photo;//照片
	private String note;//备注
	private String state;//目前状态
	private int classId;//班级
	private int deptId;//部门
	private List<Score> score;
	private SchoolEvaluation SchoolEvaluation;
	private List<JobEvaluation> JobEvaluation;
	private Dept dept;
	private ClassDate classDate;
	public ClassDate getClassDate() {
		return classDate;
	}
	public void setClassDate(ClassDate classDate) {
		this.classDate = classDate;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public List<Score> getScore() {
		return score;
	}
	public void setScore(List<Score> score) {
		this.score = score;
	}
	public SchoolEvaluation getSchoolEvaluation() {
		return SchoolEvaluation;
	}
	public void setSchoolEvaluation(SchoolEvaluation schoolEvaluation) {
		SchoolEvaluation = schoolEvaluation;
	}
	
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public String getStuName() {
		return stuName;
	}
	public void setStuName(String stuName) {
		this.stuName = stuName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getBirthPlace() {
		return birthPlace;
	}
	public void setBirthPlace(String birthPlace) {
		this.birthPlace = birthPlace;
	}
	public String getMarry() {
		return marry;
	}
	public void setMarry(String marry) {
		this.marry = marry;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getClassId() {
		return classId;
	}
	public void setClassId(int classId) {
		this.classId = classId;
	}
	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}
	
	public Student(){
		super();
	}
	
	public List<JobEvaluation> getJobEvaluation() {
		return JobEvaluation;
	}
	public void setJobEvaluation(List<JobEvaluation> jobEvaluation) {
		JobEvaluation = jobEvaluation;
	}
	public Student(int stuId, String stuName, String sex, String nation, Date birthday, String birthPlace, String marry,
			String telephone, String idCard, String university, String major, String photo, String note, String state,
			int classId, int deptId, List<Score> score, com.jxdedu.entity.SchoolEvaluation schoolEvaluation,
			List<com.jxdedu.entity.JobEvaluation> jobEvaluation, Dept dept, ClassDate classDate) {
		super();
		this.stuId = stuId;
		this.stuName = stuName;
		this.sex = sex;
		this.nation = nation;
		this.birthday = birthday;
		this.birthPlace = birthPlace;
		this.marry = marry;
		this.telephone = telephone;
		this.idCard = idCard;
		this.university = university;
		this.major = major;
		this.photo = photo;
		this.note = note;
		this.state = state;
		this.classId = classId;
		this.deptId = deptId;
		this.score = score;
		SchoolEvaluation = schoolEvaluation;
		JobEvaluation = jobEvaluation;
		this.dept = dept;
		this.classDate = classDate;
	}

	
}
