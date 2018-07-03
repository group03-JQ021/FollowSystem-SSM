package com.jxdedu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxdedu.biz.CourseBiz;
import com.jxdedu.entity.Course;
import com.jxdedu.entity.Student;

@Controller
@Scope("prototype")
@SessionAttributes({"courseCurrentPage","courseId"})
public class CourseController {
	@Resource(name = "courseBiz")
	private CourseBiz courseBiz;

	@RequestMapping("/getSubCourse")
	public String getSubCourse(String pageNum, Model model) {
		// 当前页
		int courseCurrentPage = 1;

		if (pageNum != null) {
			courseCurrentPage = Integer.parseInt(pageNum);
		}

		// 页容量
		int pageSize = 2;

		// 获取课程表的行数
		int totalNum = courseBiz.getCourseRowNum();

		// 获取总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (courseCurrentPage <= 1) {
			courseCurrentPage = 1;
		} else if (courseCurrentPage >= pageCount) {
			courseCurrentPage = pageCount;
		}

		// 获取开始行和结束行
		int startIndex = (courseCurrentPage - 1) * pageSize + 1;
		int endIndex = courseCurrentPage * pageSize < totalNum ? courseCurrentPage * pageSize : totalNum;
		int prePage = courseCurrentPage - 1;
		int nextPage = courseCurrentPage + 1;

		// 查询到的集合
		List<Course> list = courseBiz.getSubCourse(startIndex, endIndex);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("courseCurrentPage", courseCurrentPage);
		model.addAttribute("list", list);

		return "courseInfo/courseInfoList";
	}
	
	@RequestMapping("/searchCourseByCourseId")
	public String searchCourseByCourseId(int courseId, Model model) {
		Course course = null;
		if (courseId == -1) {
			return "redirect:getSubCourse.do?pageNum=1";
		}
		List<Course> list = null;
		course = courseBiz.searchCourseByCourseId(courseId);
		if (course != null) {
			list = new ArrayList<Course>();
			list.add(course);
		}
		model.addAttribute("list", list);
		return "courseInfo/courseInfoList";
	}
	
	@RequestMapping("/getAddCoursePage")
	public String getAddCoursePage(){
		return "courseInfo/addCourseInfo";
	}
	
	@RequestMapping("/addCourse")
	public String addCourse(Course course, Model model){
		if (courseBiz.addCourse(course)) {
			model.addAttribute("addMsg","添加成功!");
		} else {
			model.addAttribute("addMsg","添加失败!!!");
		}
		return "courseInfo/addCourseInfo";
	}
	
	@RequestMapping("/delCourse")
	public String delCourse(String courseIdArr,HttpSession session, Model model){
		if(courseIdArr==null){
			model.addAttribute("delMsg","您未选中要删除的信息!");
		}
		String[] str = courseIdArr.split(",");
		if (courseBiz.delCourse(str)) {
			model.addAttribute("delMsg", "删除成功!");
		} else {
			model.addAttribute("delMsg", "删除失败!!!");
			
		}
		return "redirect:getSubCourse.do?pageNum="+session.getAttribute("courseCurrentPage");
	}
	
	@RequestMapping("/getCourseByCourseId")
	public String getCourseByCourseId(int courseId, Model model){
		Course course = null;
		course = courseBiz.searchCourseByCourseId(courseId);
		model.addAttribute("courseId", courseId);
		model.addAttribute("course", course);
		return "courseInfo/courseDetailInfo";
	}
	
	@RequestMapping("/editCourse")
	public String editCourse(int courseId, Model model){
		Course course= null;
		course = courseBiz.searchCourseByCourseId(courseId);
		
		model.addAttribute("course", course);
		
		return "courseInfo/editCourseInfo";
	}
	
	@RequestMapping("/saveCourse")
	public String saveCourse(Course course, Model model){
		
		if (courseBiz.editCourse(course)) {
			model.addAttribute("course", course);
			model.addAttribute("editMsg", "您已修改成功!");
		} else {
			model.addAttribute("course", course);
			model.addAttribute("editMsg", "您修改失败!!!");
		}
		return "courseInfo/courseDetailInfo";
	}
}
