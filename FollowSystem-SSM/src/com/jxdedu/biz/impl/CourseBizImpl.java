package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.CourseBiz;
import com.jxdedu.dao.CourseDao;
import com.jxdedu.entity.Course;

@Service("course")
public class CourseBizImpl implements CourseBiz{
	@Autowired
	private CourseDao dao;
	@Override
	public boolean addCourse(Course course) {
		// TODO Auto-generated method stub
		return dao.addCourse(course);
	}

	@Override
	public boolean editCourse(Course course) {
		// TODO Auto-generated method stub
		return dao.editCourse(course);
	}

	@Override
	public boolean delCourse(int classId) {
		// TODO Auto-generated method stub
		return dao.delCourse(classId);
	}

	@Override
	public List<Course> getAllCourse() {
		// TODO Auto-generated method stub
		return dao.getAllCourse();
	}

	@Override
	public List<Course> getSubCourse(int startIndex, int endIndex) {
		// TODO Auto-generated method stub
		return dao.getSubCourse(startIndex, endIndex);
	}

	@Override
	public int getRowNum() {
		// TODO Auto-generated method stub
		return dao.getRowNum();
	}

	@Override
	public Course getCourseByClassId(int classId) {
		// TODO Auto-generated method stub
		return dao.getCourseByClassId(classId);
	}

}
