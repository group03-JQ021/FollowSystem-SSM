package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Student;

public interface StudentManageDao {
	/**
	 * 显示所有金桥学员的信息
	 */
	List<Student> getAllStudent();
/**
 * 查询某个学员的信息
 */
	List<String> getOneStudentByName(String stuname);
	/**
	 * 显示学生评价
	 * @param stuname
	 * @return 返回学生信息
	 */
	List<Student> showStudent(int stuid);
	/**
	 * 查询学生人数
	 * @return 返回总人数
	 */
	int getRowNum();
	/**
	 * 显示某段学生的信息
	 * @param startIndex 起始位置
	 * @param endIndex 结束位置
	 * @return 学生信息
	 */
	List<Student> getSubStudents(int startIndex,int endIndex);
}
