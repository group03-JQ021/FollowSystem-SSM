package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Course;

/**
 * 课程类dao层接口
 * @author 孙加硕
 * @date 2018年6月25日
 */
public interface CourseDao {
	
	/**
	 * 添加课程
	 * @param course 课程对象
	 * @return 是否添加成功
	 */
	boolean addCourse(Course course);

	/**
	 * 批量删除课程
	 * @param arr 课程id的数组
	 * @return 是否删除成功
	 */
	boolean delCourse(String[] arr);

	/**
	 * 修改课程信息
	 * @param course 课程对象
	 * @return 是否删除成功
	 */
	boolean editCourse(Course course);

	/**
	 * 获取所有课程的记录数
	 * @return 课程的记录数
	 */
	int getCourseRowNum();

	/**
	 * 分页查询
	 * @param startIndex 开始行号
	 * @param endIndex 结束行号
	 * @return 分页查询课程的集合
	 */
	List<Course> getSubCourse(int startIndex, int endIndex);
	/**
	 * 模糊查询
	 * @param className 输入查询的名称
	 * @return 包含出入名称的课程数据集合
	 */
	List<Course> likeSearchCourse(String courseName);
	/**
	 * 通过课程名称获取课程
	 * @param className 课程名称
	 * @return 课程对象
	 */
	Course getCourseByCourseName(String courseName);
	/**
	 * 通过课程id获取课程
	 * @param classId 课程id
	 * @return 课程对象
	 */
	Course getCourseByCourseId(int courseId);

}
