package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.JobEvaluateOptionBiz;
import com.jxdedu.dao.JobEvaluateOptionDao;
import com.jxdedu.entity.JobEvaluateOption;
@Service("option")
public class JobEvaluateOptionBizImpl implements JobEvaluateOptionBiz{
		@Autowired
		private JobEvaluateOptionDao dao;
	@Override
	public List<JobEvaluateOption> getAllJobEvaluateOption() {
		// TODO Auto-generated method stub
		return dao.getAllJobEvaluateOption();
	}

}
