package com.jxdedu.biz.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.SchoolEvaluationBiz;
import com.jxdedu.dao.SchoolEvaluationDao;
import com.jxdedu.entity.SchoolEvaluation;
@Service("school")
public class SchoolEvaluationBizImpl implements SchoolEvaluationBiz{
	@Autowired
	private SchoolEvaluationDao dao;
	@Override
	public boolean addSchoolEvaluation(SchoolEvaluation evaluation) {
		// TODO Auto-generated method stub
		return dao.addSchoolEvaluation(evaluation);
	}

	@Override
	public boolean updateSchoolEvaluation(SchoolEvaluation newEvaluation) {
		// TODO Auto-generated method stub
		return dao.updateSchoolEvaluation(newEvaluation);
	}

	@Override
	public List<SchoolEvaluation> getAllSchoolEvaluation() {
		// TODO Auto-generated method stub
		return dao.getAllSchoolEvaluation();
	}

	@Override
	public SchoolEvaluation getSchoolEvaluationByID(SchoolEvaluation evaluation) {
		// TODO Auto-generated method stub
		return dao.getSchoolEvaluationByID(evaluation);
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public SchoolEvaluation getSchoolEvaluationBystuId(int stuId) {
		// TODO Auto-generated method stub
		return dao.getSchoolEvaluationBystuId(stuId);
	}


}
