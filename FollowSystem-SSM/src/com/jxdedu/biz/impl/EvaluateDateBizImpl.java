package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.EvaluateDateBiz;
import com.jxdedu.dao.EvaluateDateDao;
import com.jxdedu.entity.EvaluateDate;

@Service("date")
public class EvaluateDateBizImpl implements EvaluateDateBiz{
	@Autowired
	private EvaluateDateDao dao;

	@Override
	public List<EvaluateDate> showEvaluateDate() {
		// TODO Auto-generated method stub
		return dao.showEvaluateDate();
	}
	
}
