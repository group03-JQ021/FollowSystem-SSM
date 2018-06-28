package com.jxdedu.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.dao.ScoreDao;
import com.jxdedu.entity.Score;
@Service("score")
public class ScoreBizImpl implements ScoreBiz{
	@Autowired
	private ScoreDao dao;
	@Override
	public boolean addScore(Score score) {
		// TODO Auto-generated method stub
		return dao.addScore(score);
	}

	@Override
	public boolean updateScore(Score score) {
		// TODO Auto-generated method stub
		return dao.updateScore(score);
	}

	@Override
	public List<Score> getAllScore() {
		// TODO Auto-generated method stub
		return dao.getAllScore();
	}

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return dao.getTotalCount();
	}

	@Override
	public List<Score> getoneScoreById(int stuId) {
		// TODO Auto-generated method stub
		return dao.getoneScoreById(stuId);
	}

}
