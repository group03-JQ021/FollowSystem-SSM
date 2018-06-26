package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxdedu.biz.CourseBiz;
import com.jxdedu.biz.EvaluateDateBiz;
import com.jxdedu.biz.JobEvaluationBiz;
import com.jxdedu.biz.ScoreBiz;
import com.jxdedu.biz.StudentBiz;
import com.jxdedu.entity.Course;
import com.jxdedu.entity.EvaluateDate;
import com.jxdedu.entity.JobEvaluation;
import com.jxdedu.entity.Score;
import com.jxdedu.entity.Student;

@Controller
public class StudentController {
	@Resource(name="student")
	private StudentBiz stus;
	@Resource(name="course")
	private CourseBiz cou;
	@Resource(name="score")
	private ScoreBiz sc;
	@Resource(name="je")
	private JobEvaluationBiz job;
	@Resource(name="date")
	private EvaluateDateBiz ed;
	@RequestMapping("/StudentManage")	
	public String  getStudent(Model model){
		List<Student> stu = stus.getAllStudent();
		List<Score> score = sc.getAllScore();
		List<JobEvaluation> j = job.getAllJobEvaluation();
		List<EvaluateDate> date = ed.showEvaluateDate();
		List<Course> course = cou.getAllCourse();
		model.addAttribute("stu", stu);
		model.addAttribute("score", score);
		model.addAttribute("j", j);
		model.addAttribute("date", date);
		model.addAttribute("course",course);
		return "StudentManage";
	}
	 @RequestMapping("/getSubStudent")
	    public String doGetSubKids(int currentPage,Model model){
	    	int totalnum = stus.getRowNum();
	    	int pageSize = 3;
	    	int pageCount = totalnum % pageSize == 0 ? totalnum / pageSize
					: totalnum / pageSize + 1;
			
			// 首尾页控制，首尾页控制必须在得到起始位置前完成，否则起始位置计算错误，将取不到数据。
			if (currentPage < 1) {
				currentPage = 1;
			} else if (currentPage > pageCount) {
				currentPage = pageCount;
			}

			int startIndex = (currentPage - 1) * pageSize + 1;
			 int endIndex = currentPage * pageSize > totalnum ? totalnum
					: currentPage * pageSize;
		    	List<Student> list = stus.getSubStudent(startIndex, endIndex);
			 model.addAttribute("prePage", currentPage-1);
			 model.addAttribute("nextPage", currentPage+1);
			 model.addAttribute("list", list);
			 model.addAttribute("pageCount", pageCount);
	    	return "StudentManage";
	 }
}
