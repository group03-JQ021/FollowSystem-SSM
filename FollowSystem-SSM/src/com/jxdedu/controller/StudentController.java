package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jxdedu.biz.StudentBiz;
import com.jxdedu.entity.Student;

/**
 * 
 * @author 孙加硕
 * @date 2018年6月25日
 */
@Controller
@Scope("prototype")
public class StudentController {
	@Resource(name = "kb")
	private StudentBiz studentBiz;

	@RequestMapping("/getSubStudent")
	public String doGetSubStudent(String pageNum, Model model) {
		// 当前页数
		int currentPage = 1;
		if (pageNum != null) {
			currentPage = Integer.parseInt(pageNum);
		}

		// 页容量
		int pageSize = 3;

		// 获取所有的行数
		int totalNum = studentBiz.getStuRowNum();

		// 获取数据的总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (currentPage <= 1) {
			currentPage = 1;
		} else if (currentPage >= pageCount) {
			currentPage = pageCount;
		}
		// 获取开始行和结束行
		int startIndex = (currentPage - 1) * pageSize + 1;
		int endIndex = currentPage * pageSize < totalNum ? currentPage * pageSize : totalNum;
		int prePage = currentPage - 1;
		int nextPage = currentPage + 1;
		// 查询到的集合
		List<Student> list = studentBiz.getSubStudent(startIndex, endIndex);
		System.out.println(" 结果为" + list);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("list", list);
		return "welcome.jsp";
	}
}
