package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.JobEvaluationBiz;
import com.jxdedu.dao.JobEvaluationDao;
import com.jxdedu.entity.JobEvaluation;
@Service("je")
public class JobEvaluationBizImpl implements JobEvaluationBiz {
	@Autowired
	private JobEvaluationDao job;
	@Override
	public boolean addJobEvaluation(List<JobEvaluation> evaluation) {
		// TODO Auto-generated method stub
		return job.addJobEvaluation(evaluation);
	}

	@Override
	public boolean updateJobEvaluation(JobEvaluation newEvaluation) {
		// TODO Auto-generated method stub
		return job.updateJobEvaluation(newEvaluation);
	}
	@Override
	public List<JobEvaluation> getAllJobEvaluation() {
		// TODO Auto-generated method stub
		return job.getAllJobEvaluation();
	}

	@Override
	public JobEvaluation getJobEvaluationByID(JobEvaluation evaluation) {
		// TODO Auto-generated method stub
		return job.getJobEvaluationByID(evaluation);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return job.getTotalCount();
	}


	@Override
	public List<JobEvaluation> showJobEvaluations(int stuid) {
		// TODO Auto-generated method stub
		return job.showJobEvaluations(stuid);
	}

	@Override
	public List<JobEvaluation> getJobEvaluation(int stuid) {
		// TODO Auto-generated method stub
		return job.getJobEvaluation(stuid);
	}

}
