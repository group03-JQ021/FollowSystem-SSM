package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Student;

/**
 * 学生类dao层接口
 * @author 孙加硕
 * @date 2018年6月24日
 */
public interface StudentDao {
	
	
	/**
	 * 获取所有学生的记录数
	 * @return 学生的总数
	 */
	int getStuRowNum();
	/**
	 * 分页查询
	 * @param startIndex 开始行号
	 * @param endIndex 结束行号
	 * @return 分页查询的学生数据集合
	 */
	List<Student> getSubStudent(int startIndex,int endIndex);
	
	/**
	 * 通过学生编号查询某个学生
	 * @param stuId 学生id
	 * @return	学生对象
	 */
	Student getStudentByStuId(int stuId);
	
	/**
	 * 添加学生
	 * @param student 学生对象
	 * @return 是否添加成功
	 */
	boolean addStudent(Student student);
	
	/**
	 * 批量删除学生
	 * @param arr 学生id数组 
	 * @return 是否删除成功
	 */
	boolean delStudents(String[] stuIdArr);
	
	/**
	 * 通过学生id查询学生
	 * @param stuId 学生id
	 * @return 该学生的信息
	 */
	Student getStuByStuId(int stuId);
	
	/**
	 * 修改学生信息
	 * @param student 学生
	 * @return 是否成功删除
	 */
	boolean editStudent(Student student);
	
	/**
	 * 模糊查询
	 * @param stuName 输入的名称
	 * @return 包含输入名称的学生对象
	 *//*
	List<Student> likeSearchStu(String stuName);
	/**
	 * 通过学生姓名查询学生
	 * @param stuName 学生姓名
	 * @return 该学生的信息
	 *//*
	Student getStuByName(String stuName);
	*/
	
	
}
