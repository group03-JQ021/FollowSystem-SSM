package com.jxdedu.controller;



import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import com.jxdedu.biz.SchoolEvaluationBiz;
import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.entity.SchoolEvaluation;
@Controller
public class SchoolController {
	@Resource(name="school")
	private SchoolEvaluationBiz sch;
	@Resource(name="score")
	private ScoreBiz sc;
	
	@RequestMapping("/addSchoolScore")
	public String doaddScore( SchoolEvaluation evaluation,
			Model model){	
			if(sch.addSchoolEvaluation(evaluation)){
				model.addAttribute("msg", "添加成功");
				return "redirect:StudentManage.do?currentpage=1";
				
			}else{
				model.addAttribute("msg", "添加失败");
				return"AddSchoolScore";
			}
		
	}
}
