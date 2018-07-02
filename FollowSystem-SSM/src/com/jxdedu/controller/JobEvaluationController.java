package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jxdedu.biz.ClassDateBiz;
import com.jxdedu.biz.CourseBiz;
import com.jxdedu.biz.DeptBiz;
import com.jxdedu.biz.EvaluateDateBiz;
import com.jxdedu.biz.JobEvaluateOptionBiz;
import com.jxdedu.biz.JobEvaluationBiz;
import com.jxdedu.biz.SchoolEvaluationBiz;
import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.biz.StudentBiz;
import com.jxdedu.entity.ClassDate;
import com.jxdedu.entity.Course;
import com.jxdedu.entity.Dept;
import com.jxdedu.entity.EvaluateDate;
import com.jxdedu.entity.JobEvaluateOption;
import com.jxdedu.entity.JobEvaluation;
import com.jxdedu.entity.SchoolEvaluation;
import com.jxdedu.entity.Score;
import com.jxdedu.entity.Student;

@Controller
public class JobEvaluationController {
	@Resource(name = "je")
	private JobEvaluationBiz biz;
	@Resource(name = "date")
	private EvaluateDateBiz ed;
	@Resource(name = "dept")
	private DeptBiz d;
	@Resource(name = "option")
	private JobEvaluateOptionBiz p;
	@Resource(name = "course")
	private CourseBiz cou;
	@Resource(name = "student")
	private StudentBiz stu;
	@Resource(name = "class")
	private ClassDateBiz cd;
	@Resource(name = "school")
	private SchoolEvaluationBiz School;
	@Resource(name = "score")
	private ScoreBiz sc;

	@RequestMapping("/showJobEvaluation")
	public String showJobEvaluation(int stuid, Model model) {
		Student student = stu.getStudentById(stuid);
		SchoolEvaluation schools = School.getSchoolEvaluationBystuId(stuid);
		List<Score> score = sc.getoneScoreById(stuid);
		List<JobEvaluation> list = biz.showJobEvaluations(stuid);
		List<JobEvaluation> list1 = biz.getJobEvaluation(stuid);
		List<EvaluateDate> date = ed.showEvaluateDate();
		List<JobEvaluateOption> option = p.getAllJobEvaluateOption();
		List<Dept> dept = d.getAllDept();
		List<Course> course = cou.getAllCourse();
		List<ClassDate> cds = cd.getAllClassDate();
		model.addAttribute("score", score);
		model.addAttribute("list", list);
		model.addAttribute("list1", list1);
		model.addAttribute("student", student);
		model.addAttribute("date", date);
		model.addAttribute("dept", dept);
		model.addAttribute("option", option);
		model.addAttribute("course", course);
		model.addAttribute("cds", cds);
		model.addAttribute("schools", schools);
		return "JobEvaluation";
	}

	@RequestMapping("/redirection")
	public String doRedirection(int dateid, int stuid, Model model) {
		model.addAttribute("dateid", dateid);
		model.addAttribute("stuid", stuid);
		return "AddJobEvaluation";
	}

	@RequestMapping("/addJobEvaluation")
	public String addJobEvaluation(Integer dateId, Integer stuId, String optionName,
			@RequestParam(value = "evaluateScore", required = false) List<Double> scores, double totalScore,
			String jobEvaluateContent, Model model) {
		int optionId = 1;
		for (Double score : scores) {
			if (biz.addJobEvaluation(dateId, stuId, optionId, optionName, totalScore, jobEvaluateContent,score)) {
				optionId++;
			}
		}
		
		if(optionId==7){
			model.addAttribute("dateid", dateId);
			model.addAttribute("stuid", stuId);
			return "redirect:showJobEvaluation.do";
		}else{
			biz.delJobEvaluation(dateId, stuId);
				model.addAttribute("msg", "添加失败");
				return"AddJobEvaluation";
			}		
		}		
	}

