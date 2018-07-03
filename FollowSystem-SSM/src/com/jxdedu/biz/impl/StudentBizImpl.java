package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.StudentBiz;
import com.jxdedu.dao.StudentDao;
import com.jxdedu.entity.Student;
@Service("studentBiz")
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

	@Override
	public Student getStudentByStuId(int stuId) {
		return studentDao.getStudentByStuId(stuId);
	}

	@Override
	public boolean addStudent(Student student) {
		return studentDao.addStudent(student);
	}

	@Override
	public boolean delStudents(String[] stuIdArr) {
		/*int[] stuID = new int[stuIdArr.length];
		for(int i = 0; i<stuID.length; i++) {
			stuID[i] = Integer.parseInt(stuIdArr[i]);
		}*/
		return studentDao.delStudents(stuIdArr);
	}

	@Override
	public Student getStuByStuId(int stuId) {
		return studentDao.getStuByStuId(stuId);
	}
	
	@Override
	public boolean editStudent(Student student) {
		return studentDao.editStudent(student);
	}


}
