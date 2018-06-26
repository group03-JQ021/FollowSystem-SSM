package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxdedu.biz.DeptBiz;
import com.jxdedu.biz.EvaluateDateBiz;
import com.jxdedu.biz.JobEvaluateOptionBiz;
import com.jxdedu.biz.JobEvaluationBiz;
import com.jxdedu.entity.Dept;
import com.jxdedu.entity.EvaluateDate;
import com.jxdedu.entity.JobEvaluateOption;
import com.jxdedu.entity.JobEvaluation;
import com.jxdedu.entity.Student;

@Controller
public class JobEvaluationController {
	@Resource(name="je")
	private JobEvaluationBiz biz;
	@Resource(name="date")
	private EvaluateDateBiz ed;
	@Resource(name="dept")
	private DeptBiz d ;
	@Resource(name="option")
	private JobEvaluateOptionBiz p;
	@RequestMapping("/showJobEvaluation")
	public String showJobEvaluation(int stuid,Model model){
		List<JobEvaluation> list = biz.showJobEvaluations(stuid);
		List<JobEvaluation> list1 = biz.getJobEvaluation(stuid);
		List<EvaluateDate> date = ed.showEvaluateDate();
		List<JobEvaluateOption> option = p.getAllJobEvaluateOption();
		List<Dept> dept = d.getAllDept();
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("date", date);
		model.addAttribute("dept", dept);
		model.addAttribute("option", option);
		return "JobEvaluation";
	}
	@RequestMapping("/addJobEvaluation")
		public String addJobEvaluation(JobEvaluation evaluation, Student stuid, JobEvaluateOption optionid,
			EvaluateDate dateid,Model model){
		if(biz.addJobEvaluation(evaluation, stuid, optionid, dateid)){
			model.addAttribute("addMsg", "添加成功");
		}else{
			model.addAttribute("addMsg", "添加失败");
		}
		return "JobEvaluation";
	}
}
