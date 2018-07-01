package com.jxdedu.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxdedu.biz.DeptBiz;
import com.jxdedu.entity.Dept;

/**
 * 
 * @author 孙加硕
 * @date 2018年6月25日
 */
@Controller
@Scope("prototype")
@SessionAttributes({"deptCurrentPage","deptId"})
public class DeptController {
	@Resource(name = "deptBiz")
	private DeptBiz deptBiz;

	Logger logger = Logger.getLogger(DeptController.class.getName());
	
	//分页查询
	@RequestMapping("/getSubDept")
	public String getSubDept(String pageNum, Model model) {
		// 当前页数
		//logger.info("分页:" + pageNum + ":");
		int deptCurrentPage = 1;
		if (pageNum != null) {
			deptCurrentPage = Integer.parseInt(pageNum);
		}

		// 页容量
		int pageSize = 3;

		// 获取所有的行数
		// logger.info("页面大小:" + pageSize);
		int totalNum = deptBiz.getDeptRowNum();
		// logger.info("总数:" + totalNum);
		// 获取数据的总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (deptCurrentPage <= 1) {
			deptCurrentPage = 1;
		} else if (deptCurrentPage >= pageCount) {
			deptCurrentPage = pageCount;
		}
		// 获取开始行和结束行
		int startIndex = (deptCurrentPage - 1) * pageSize + 1;
		int endIndex = deptCurrentPage * pageSize < totalNum ? deptCurrentPage * pageSize : totalNum;
		int prePage = deptCurrentPage - 1;
		int nextPage = deptCurrentPage + 1;
		// logger.info("查询:" + deptCurrentPage + ":" + startIndex + ":" +
		// endIndex);
		// 查询到的集合
		List<Dept> list = deptBiz.getSubDept(startIndex, endIndex);
		// logger.info("结果:" + list.size());

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("deptCurrentPage", deptCurrentPage);
		model.addAttribute("list", list);
		return "deptInfo/deptInfoList";
	}
	
	
	@RequestMapping("/fuzzySearchDeptByDeptName")
	public String fuzzySearchDeptByDeptName(String deptName,String pageNum,Model model){
		// 当前页数
		//logger.info("分页:" + pageNum + ":");
		int deptCurrentPage = 1;
		if (pageNum != null) {
			deptCurrentPage = Integer.parseInt(pageNum);
		}
		// 页容量
		int pageSize = 3;

		// 获取所有的行数
		int totalNum = deptBiz.fuzzySrarchGetDeptRowNum(deptName);
		
		// 获取数据的总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (deptCurrentPage <= 1) {
			deptCurrentPage = 1;
		} else if (deptCurrentPage >= pageCount) {
			deptCurrentPage = pageCount;
		}
		// 获取开始行和结束行
		int startIndex = (deptCurrentPage - 1) * pageSize + 1;
		int endIndex = deptCurrentPage * pageSize < totalNum ? deptCurrentPage * pageSize : totalNum;
		int prePage = deptCurrentPage - 1;
		int nextPage = deptCurrentPage + 1;
		
		List<Dept> list = null;
		list = deptBiz.fuzzySearchDeptByDeptName(deptName, startIndex, endIndex);
		
		System.out.println("搜索结果:"+list);
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("deptCurrentPage", deptCurrentPage);
		model.addAttribute("list", list);
		return "deptInfo/deptInfoList";
	}
	
	@RequestMapping("/searchDeptByDeptId")
	public String searchDeptByDeptId(Integer deptId,Model model){
		Dept dept = null;
		if (deptId==-1) {
			
			return "redirect:getSubDept.do?pageNum=1";
		}
		dept = deptBiz.getDeptByDeptId(deptId);
		List<Dept> list = new ArrayList<Dept>();
		list.add(dept);
		model.addAttribute("list",list);
		model.addAttribute("deptId",deptId);
		return "deptInfo/deptInfoList";
	}
	
	
	//添加
	@RequestMapping("/getAddDeptPage")
	public String getAddDeptPage(){
		return "deptInfo/addDeptInfo";
	}
	@RequestMapping("/addDept")
	public String addDept(Dept dept,Model model){
		if (deptBiz.addDept(dept)) {
			model.addAttribute("addMsg","添加成功!");
		} else {
			model.addAttribute("addMsg","添加失败!!!");
		}
		return "deptInfo/addDeptInfo";
	}
	
	
	//通过id获取部门详细信息
	@RequestMapping("/getDeptByDeptId")
	public String getDeptByDeptId(int deptId, Model model) {
		Dept dept = null;
		dept = deptBiz.getDeptByDeptId(deptId);
		model.addAttribute("dept", dept);
		model.addAttribute("deptId",deptId);
		return "deptInfo/deptDetailInfo";
	}
	
	@RequestMapping("/delDept")
	public String delDept(String deptIdArr, HttpSession session,Model model){
		if(deptIdArr==null){
			model.addAttribute("delMsg","您未选中要删除的信息!");
		}
		String[] str = deptIdArr.split(",");
		if (deptBiz.delDept(str)) {
			model.addAttribute("delMsg", "删除成功!");
		} else {
			model.addAttribute("delMsg", "删除失败!!!");
			
		}
		return "redirect:getSubDept.do?pageNum="+session.getAttribute("deptCurrentPage");
	}
	
	//修改
	@RequestMapping("/editDept")
	public String editDept(int deptId,Model model){
	
		
		Dept dept = null;
		dept = deptBiz.getDeptByDeptId(deptId);
		model.addAttribute("dept",dept);
		System.out.println(dept.getDeptId());
		System.out.println(dept.getDeptName());
		System.out.println(dept.getDeptAddress());
		
		
		return "deptInfo/editDeptInfo";
	}
	@RequestMapping("saveDept")
	public String saveDept(Dept dept,Model model){
		
		
		if(deptBiz.editDept(dept)){
			model.addAttribute("dept",dept);
			model.addAttribute("editMsg","您已修改成功!");
		} else {
			dept = deptBiz.getDeptByDeptId(dept.getDeptId());
			model.addAttribute("dept",dept);
			model.addAttribute("editMsg","您修改失败!");
		}
		return "deptInfo/deptDetailInfo";
	}

}
