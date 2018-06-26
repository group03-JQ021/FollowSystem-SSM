package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.StudentBiz;
import com.jxdedu.dao.StudentDao;
import com.jxdedu.entity.Student;
@Service("student")
public class StudentBizImpl implements StudentBiz {
	@Autowired
	private StudentDao dao;
	@Override
	public boolean addStudent(Student stu) {
		return dao.addStudent(stu);
	}

	@Override
	public boolean delStudent(String stuId) {
		return dao.delStudent(stuId);
	}

	@Override
	public boolean editStudent(Student stu) {
		return dao.editStudent(stu);
	}

	@Override
	public List<Student> getAllStudent() {
		return dao.getAllStudent();
	}

	@Override
	public List<Student> getOneStudentByName(String name) {
		return dao.getOneStudentByName(name);
	}

	@Override
	public List<Student> getSubStudent(int startIndex, int endIndex) {
		return dao.getSubStudent(startIndex, endIndex);
	}

	@Override
	public int getRowNum() {
		return dao.getRowNum();
	}

	@Override
	public Student getStudentById(int stuId) {
		return dao.getStudentById(stuId);
	}

}
