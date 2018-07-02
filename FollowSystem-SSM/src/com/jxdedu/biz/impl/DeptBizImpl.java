package com.jxdedu.biz.impl;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.DeptBiz;
import com.jxdedu.controller.DeptController;
import com.jxdedu.dao.DeptDao;
import com.jxdedu.entity.Dept;

/**
 * 
 * @author 孙加硕
 * @date 2018年6月25日
 */
@Service("deptBiz")
public class DeptBizImpl implements DeptBiz {
	
	@Autowired
	private DeptDao deptDao;
	
	Logger logger = Logger.getLogger(DeptBizImpl.class.getName());
	
	@Override
	public int getDeptRowNum() {
		int rowNum = 0;
		//logger.info("查询行数:");
		rowNum = deptDao.getDeptRowNum();
		//rowNum = 3;
		return rowNum;
	}

	@Override
	public List<Dept> getSubDept(int startIndex, int endIndex) {
		List<Dept> list = null;
		list = deptDao.getSubDept(startIndex, endIndex);
		return list;
	}
	
	@Override
	public int fuzzySrarchGetDeptRowNum(String deptName) {
		int fsRowNum = 0;
		fsRowNum = deptDao.fuzzySrarchGetDeptRowNum(deptName);
		return fsRowNum;
	}
	@Override
	public List<Dept> fuzzySearchDeptByDeptName(String deptName,int startIndex,int endIndex) {
		List<Dept> list = null;
		if(deptName==null){
			deptName="";
		}
		list = deptDao.fuzzySearchDeptByDeptName(deptName,startIndex, endIndex);
		return list;
	}
	/*@Override
	public List<Dept> fuzzySearchDept(String deptName) {
		List<Dept> list = null;
		list = deptDao.fuzzySearchDept(deptName);
		return list;
	}*/
	
	@Override
	public boolean addDept(Dept dept) {
		return deptDao.addDept(dept);
	}
	
	@Override
	public Dept getDeptByDeptId(int deptId) {
		Dept dept = null;
		dept = deptDao.getDeptByDeptId(deptId);
		return dept;
	}
	
	@Override
	public boolean delDept(String[] deptIdArr) {
		return deptDao.delDept(deptIdArr);
	}
	
	@Override
	public boolean editDept(Dept dept) {
		return deptDao.editDept(dept);
	}

	@Override
	public List<Dept> getAllDept() {
		return deptDao.getAllDept();
	}
	
	

}
