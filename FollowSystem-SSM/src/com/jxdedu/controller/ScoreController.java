package com.jxdedu.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.jxdedu.biz.ScoreBiz;

@Controller
@Scope("prototype")
public class ScoreController {
	
	@Resource(name="scoreBiz")
	private ScoreBiz scoreBiz;
}
