package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.CourseBiz;
import com.jxdedu.dao.CourseDao;
import com.jxdedu.entity.Course;

/**
 * 
 * @author 孙加硕
 * @date 2018年7月1日
 */
@Service("courseBiz")
public class CourseBizImpl implements CourseBiz {
	
	@Autowired
	private CourseDao courseDao;
	
	@Override
	public int getCourseRowNum() {
		return courseDao.getCourseRowNum();
	}

	@Override
	public List<Course> getSubCourse(int startIndex, int endIndex) {
		return courseDao.getSubCourse(startIndex, endIndex);
	}

	@Override
	public Course searchCourseByCourseId(int courseId) {
		return courseDao.searchCourseByCourseId(courseId);
	}

	@Override
	public boolean addCourse(Course course) {
		return courseDao.addCourse(course);
	}

	@Override
	public boolean delCourse(String[] arr) {
		return courseDao.delCourse(arr);
	}

	@Override
	public boolean editCourse(Course course) {
		return courseDao.editCourse(course);
	}
	
}
