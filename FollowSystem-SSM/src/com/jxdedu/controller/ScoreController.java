package com.jxdedu.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxdedu.biz.CourseBiz;
import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.entity.Course;
import com.jxdedu.entity.Score;

@Controller
public class ScoreController {
	@Resource(name="score")
	private ScoreBiz sc;
	@Resource(name="course")
	private CourseBiz cou;
	@RequestMapping("/setSchoolScore")
	public String getcontinue(int stuid,Model model){	
		model.addAttribute("stuid", stuid);
		return"AddSchoolScore";
	}
	@RequestMapping("/setScore")
	public String getScore(int stuid,Integer courseid,Model model){
		Course course = cou.getCourseByCourseId(courseid);
		model.addAttribute("stuid", stuid);
		model.addAttribute("course", course);
		return "AddScore";
	}
	@RequestMapping("/addScore")
	public String addScore(Score score,Model model){
		if(sc.addScore(score)){
			return "redirect:StudentManage.do?currentpage=1";
		}else{
			model.addAttribute("msg", "添加失败");
			return "AddScore";
		}
	}
}
