package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.StudentBiz;
import com.jxdedu.dao.StudentDao;
import com.jxdedu.entity.Student;
@Service("kb")
public class StudentBizImpl implements StudentBiz{
	@Autowired
	private StudentDao studentDao;
	
	@Override
	public int getStuRowNum() {
		int rowNum = 0;
		rowNum = studentDao.getStuRowNum();
		return rowNum;
	}

	@Override
	public List<Student> getSubStudent(int startIndex, int endIndex) {
		List<Student> list = null;
		list = studentDao.getSubStudent(startIndex, endIndex);
		return list;
	}

	/*@Override
	public List<Student> likeSearchStu(String stuName) {
		return null;
	}

	@Override
	public Student getStuByName(String stuName) {
		return null;
	}

	@Override
	public Student getStuByStuId(int stuId) {
		return null;
	}

	@Override
	public Student getAllStuInfo() {
		return null;
	}
	@Override
	public boolean addStudent(Student student) {
		return false;
	}

	@Override
	public boolean delStudent(String[] arr) {
		return false;
	}

	@Override
	public boolean editStudent(Student student) {
		return false;
	}*/

}
