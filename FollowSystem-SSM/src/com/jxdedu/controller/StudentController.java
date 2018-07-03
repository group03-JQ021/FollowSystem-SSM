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

import com.jxdedu.biz.ClassDateBiz;
import com.jxdedu.biz.DeptBiz;
import com.jxdedu.biz.StudentBiz;
import com.jxdedu.entity.ClassDate;
import com.jxdedu.entity.Dept;
import com.jxdedu.entity.Student;

/**
 * 
 * @author 孙加硕
 * @date 2018年6月25日
 */
@Controller
@Scope("prototype")	
@SessionAttributes({"studentCurrentPage","stuId"})
public class StudentController {
	@Resource(name = "studentBiz")
	private StudentBiz studentBiz;
	
	@Resource(name = "deptBiz")
	private DeptBiz deptBiz;
	
	@Resource(name = "classDateBiz")
	private ClassDateBiz classDateBiz;
	
	@RequestMapping("/getSubStudent")
	public String doGetSubStudent(String pageNum, Model model) {
		System.out.println("执行删除了");
		// 当前页数
		int studentCurrentPage = 1;
		if (pageNum != null) {
			studentCurrentPage = Integer.parseInt(pageNum);
		}

		// 页容量
		int pageSize = 3;

		// 获取所有的行数
		int totalNum = studentBiz.getStuRowNum();

		// 获取数据的总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (studentCurrentPage <= 1) {
			studentCurrentPage = 1;
		} else if (studentCurrentPage >= pageCount) {
			studentCurrentPage = pageCount;
		}
		// 获取开始行和结束行
		int startIndex = (studentCurrentPage - 1) * pageSize + 1;
		int endIndex = studentCurrentPage * pageSize < totalNum ? studentCurrentPage * pageSize : totalNum;
		int prePage = studentCurrentPage - 1;
		int nextPage = studentCurrentPage + 1;
		// 查询到的集合
		List<Student> list = studentBiz.getSubStudent(startIndex, endIndex);
		System.out.println(" 结果为" + list);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("studentCurrentPage",studentCurrentPage);
		model.addAttribute("list",list);
		System.out.println(list);
		return "studentInfo/studentInfoList";
	}
	
	@RequestMapping("/searchStuByStuId")
	public String searchStuByStuId(int stuId,Model model){
		Student student = null;
		if(stuId==-1){
			return "redirect:getSubStudent.do?pageNum=1";
		} 
		List<Student> list = null;
		student = studentBiz.getStudentByStuId(stuId);
		if (student != null){
			list = new ArrayList<>();
			list.add(student);
		}
		model.addAttribute("list", list);
		return "studentInfo/studentInfoList";
	}
	
	//获取学员添加页面
	@RequestMapping("/getAddStudentPage")
	public String getAddStudentPage(Model model){
		// 查询部门和班级
		List<Dept> deptList = deptBiz.getAllDept();
		List<ClassDate> classDateList = classDateBiz.getAllClassDate();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("classDateList", classDateList);
		return "studentInfo/addStudentInfoPage";
	}
	
	@RequestMapping("/addStudent")
	public String addStudent(Student student, Model model){
		System.out.println("添加信息为:"+student);
		if (studentBiz.addStudent(student)) {
			model.addAttribute("addMsg","添加成功!");
		} else {
			model.addAttribute("addMsg","添加失败!!!");
		}
		return "studentInfo/addStudentInfoPage";
	}
	
	@RequestMapping("/delStudents")
	public String delStudents(String stuIdArr, HttpSession session, Model model){
		if (stuIdArr==null) {
			model.addAttribute("delMdg", "您未选中要删除的信息!");
			return "redirect:getSubStudent.do?pageNum="+session.getAttribute("studentCurrentPage");
		}
		String[] str = stuIdArr.split(",");
		System.out.println("删除的上面!");
		if (studentBiz.delStudents(str)) {
			System.out.println("删除成功!");
			model.addAttribute("delMsg", "删除成功!");
		} else {
			System.out.println("删除失败!");
			model.addAttribute("delMsg", "删除失败!!!");
			
		}
		System.out.println("选择的为"+str);
		System.out.println("删除的下面!");
		return "redirect:getSubStudent.do?pageNum="+session.getAttribute("studentCurrentPage");
	}
	
	@RequestMapping("/getStuByStuId")
	public String getStuByStuId(int stuId,Model model){
		Student student = null;
		student = studentBiz.getStuByStuId(stuId);
		model.addAttribute("stuId", stuId);
		model.addAttribute("student", student);
		return "studentInfo/studentDetailInfo";
	}
	
	@RequestMapping("/editStudent")
	public String editStudent(int stuId,Model model){
		Student student = null;
		student = studentBiz.getStuByStuId(stuId);
		model.addAttribute("student", student);
		// 查询部门和班级
		List<Dept> deptList = deptBiz.getAllDept();
		List<ClassDate> classDateList = classDateBiz.getAllClassDate();
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("classDateList", classDateList);
		return "studentInfo/editStudentInfo";
	}
	
	@RequestMapping("/saveStudent")
	public String saveStudent(Student student, Model model){
		if (studentBiz.editStudent(student)) {
			model.addAttribute("student", student);
			model.addAttribute("editMsg", "您已修改成功!");
		} else {
			model.addAttribute("student", student);
			model.addAttribute("editMsg", "您已修改失败!!!");
		}
		
		return "studentInfo/studentDetailInfo";
	}
}
