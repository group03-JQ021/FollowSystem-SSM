package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.ClassDateBiz;
import com.jxdedu.dao.ClassDateDao;
import com.jxdedu.entity.ClassDate;

@Service("classDateBiz")
public class ClassDateBizImpl implements ClassDateBiz{
	
	@Autowired
	private ClassDateDao classDateDao;
	
	@Override
	public List<ClassDate> getAllClassDate() {
		return classDateDao.getAllClassDate();
	}

}
