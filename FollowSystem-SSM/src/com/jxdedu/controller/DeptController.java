package com.jxdedu.controller;

import java.util.List;

import javax.annotation.Resource;

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
@SessionAttributes({"deptCurrentPage","deptId","addMsg"})
public class DeptController {
	@Resource(name = "deptBiz")
	private DeptBiz deptBiz;

	Logger logger = Logger.getLogger(DeptController.class.getName());
	
	//分页查询
	@RequestMapping("/getSubDept")
	public String getSubDept(String pageNum, Model model) {
		// 当前页数
		logger.info("分页:" + pageNum + ":");
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
	
	/*@RequestMapping("/fuzzySearchDept")
	public String fuzzySearchDept(String deptName,Model model){
		List<Dept> list = null;
		list = deptBiz.fuzzySearchDept(deptName);
		model.addAttribute("list", list);
		return "getSubDept.do";
	}*/
	@RequestMapping("/fuzzySearchDept")
	public String fuzzySearchDept(int deptId,Model model){
		List<Dept> list = null;
		list = (List<Dept>) deptBiz.getDeptByDeptId(deptId);
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

	
	//修改
	@RequestMapping("/editDept")
	public String editDept(int deptId,Model model){
	
		
		Dept dept = null;
		dept = deptBiz.getDeptByDeptId(deptId);
		System.out.println(dept.getDeptId());
		System.out.println(dept.getDeptName());
		System.out.println(dept.getDeptAddress());
		
		model.addAttribute("dept",dept);
		
		if(deptBiz.editDept(dept)){
			model.addAttribute("editMsg","您已修改成功!");
		} else {
			model.addAttribute("editMsg","您修改失败!");
		}
		return "deptInfo/editDeptInfo";
	}

}
