package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Student;

public interface StudentDao {
	/**
	 * 添加学生信息到数据库
	 * @param stu 要添加的学生对象
	 * @return 是否添加成功
	 */
	boolean addStudent(Student stu);
	/**
	 * 从数据库删除学生信息
	 * @param stuId 学生id
	 * @return	是否删除成功
	 */
	boolean delStudent(String stuId);
	/**
	 * 编辑学生信息
	 * @param stu 要编辑的学生对象
	 * @return 编辑是否成功
	 */
	boolean editStudent(Student stu);
	/**
	 * 从数据库查询所有学生信息
	 * @return 学生信息列表
	 */
	List<Student> getAllStudent();
	/**
	 * 根据学生姓名查询学生信息
	 * @param name 学生姓名
	 * @return 学生信息
	 */
	List<Student> getOneStudentByName(String name);
	/**
	 * 分页查询
	 * @param startIndex 开始页
	 * @param endIndex 结束页
	 * @return 学生信息
	 */
	List<Student> getSubStudent(int startIndex,int endIndex);
	/**
	 * 获取所有记录条数
	 * @return 记录条数
	 */
	int getRowNum();
	/**
	 * 根据学号查询学生信息
	 * @param stuId 学生学号
	 * @return 学生信息
	 */
	Student getStudentById(int stuId);
}
