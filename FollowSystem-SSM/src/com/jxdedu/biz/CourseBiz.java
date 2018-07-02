package com.jxdedu.biz;

import java.util.List;

import com.jxdedu.entity.Course;

public interface CourseBiz {
	/**
	 * 添加课程信息
	 * @param course 要添加的课程
	 * @return 是否添加成功
	 */
	boolean addCourse(Course course);
	/**
	 * 编辑课程信息
	 * @param course 要编辑的课程
	 * @return 是否编辑成功
	 */
	boolean editCourse(Course course);
	/**
	 * 根据课程编号删除课程信息
	 * @param classId 课程编号 
	 * @return 是否删除成功
	 */
	boolean delCourse(int classId);
	/**
	 * 得到所有的课程信息
	 * @return 课程信息列表
	 */
	List<Course> getAllCourse();
	/**
	 * 分页查询
	 * @param startIndex 开始页
	 * @param endIndex 结束页
	 * @return 课程信息
	 */
	List<Course> getSubCourse(int startIndex,int endIndex);
	/**
	 * 获取记录总条数
	 * @return 记录条数
	 */
	int getRowNum();
	/**
	 * 根据课程id查询课程信息
	 * @param classId 课程id
	 * @return 课程信息
	 */
	Course getCourseByCourseId(int courseid);
}
