package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.jxdedu.biz.JobEOBiz;
import com.jxdedu.dao.JobEODao;
import com.jxdedu.entity.JobEvaluateOption;

/**
 * 
 * @author 孙加硕
 * @date 2018年7月2日
 */
@Service("jobEOBiz")
public class JobEOBizImpl implements JobEOBiz{
	
	@Autowired
	private JobEODao jobEODao;
	
	@Override
	public int getJEORowNum() {
		int rowNum = 0;
		rowNum = jobEODao.getJEORowNum();
		return rowNum;
	}

	@Override
	public List<JobEvaluateOption> getSubJobEO(int startIndex, int endIndex) {
		List<JobEvaluateOption> list = null;
		list = jobEODao.getSubJobEO(startIndex, endIndex);
		return list;
	}
	
	@Override
	public JobEvaluateOption getJEOByOptionId(int optionId) {
		JobEvaluateOption jobEvaluateOption = null;
		jobEvaluateOption = jobEODao.getJEOByOptionId(optionId);
		return jobEvaluateOption;
	}

	@Override
	public boolean addJobEvaluateOption(JobEvaluateOption jobEvaluateOption) {
		return jobEODao.addJobEvaluateOption(jobEvaluateOption);
	}

	@Override
	public boolean editJobEvaluateOption(JobEvaluateOption jobEvaluateOption) {
		return jobEODao.editJobEvaluateOption(jobEvaluateOption);
	}

	@Override
	public boolean delJobEvaluateOption(String[] arr) {
		return jobEODao.delJobEvaluateOption(arr);
	}
	
	
}
