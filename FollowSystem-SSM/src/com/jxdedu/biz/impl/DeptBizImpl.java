package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.DeptBiz;
import com.jxdedu.dao.DeptDao;
import com.jxdedu.entity.Dept;
@Service("dept")
public class DeptBizImpl implements DeptBiz {
	@Autowired
	private DeptDao dao;
	@Override
	public boolean editDept(Dept dept) {
		return dao.editDept(dept);
	}

	@Override
	public boolean addDept(Dept dept) {
		return dao.addDept(dept);
	}

	@Override
	public List<Dept> getAllDept() {
		return dao.getAllDept();
	}

	@Override
	public Dept getOneDeptById(int deptId) {
		return dao.getOneDeptById(deptId);
	}

	@Override
	public boolean delDept(String deptId) {
		return dao.delDept(deptId);
	}

	@Override
	public List<Dept> getSubDept(int startIndex, int endIndex) {
		return dao.getSubDept(startIndex, endIndex);
	}

	@Override
	public int getRowNum() {
		return dao.getRowNum();
	}

}
