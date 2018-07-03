package com.jxdedu.biz.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.dao.ScoreDao;

@Service("scoreBiz")
public class ScoreBizImplmpl implements ScoreBiz {
	
	@Autowired
	private ScoreDao scoredao;
	
	@Override
	public int getScoreRowNum() {
		int rowNum = 0;
		rowNum = scoredao.getScoreRowNum();
		return rowNum;
	}

}
