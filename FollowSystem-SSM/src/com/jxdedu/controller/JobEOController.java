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

import com.jxdedu.biz.JobEOBiz;
import com.jxdedu.entity.JobEvaluateOption;

/**
 * 
 * @author 孙加硕
 * @date 2018年7月2日
 */
@Controller
@Scope("prototype")
@SessionAttributes({"jobEOCurrentPage","optionId"})
public class JobEOController {
	@Resource(name = "jobEOBiz")
	private JobEOBiz jobEOBiz;

	@RequestMapping("/getSubJobEO")
	public String getSubJobEO(String pageNum, Model model) {
		// 当前页
		int jobEOCurrentPage = 1;
		if (pageNum != null) {
			jobEOCurrentPage = Integer.parseInt(pageNum);
		}

		// 页容量
		int pageSize = 2;

		// 总行数
		int totalNum = jobEOBiz.getJEORowNum();

		// 总页数
		int pageCount = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;
		if (jobEOCurrentPage <= 1) {
			jobEOCurrentPage = 1;
		} else if (jobEOCurrentPage >= pageCount) {
			jobEOCurrentPage = pageCount;
		}
		// 开始行
		int startIndex = (jobEOCurrentPage - 1) * pageSize + 1;
		// 结束行
		int endIndex = jobEOCurrentPage * pageSize < totalNum ? jobEOCurrentPage * pageSize : totalNum;
		// 上一页
		int prePage = jobEOCurrentPage - 1;
		// 下一页
		int nextPage = jobEOCurrentPage + 1;

		List<JobEvaluateOption> list = jobEOBiz.getSubJobEO(startIndex, endIndex);

		model.addAttribute("pageCount", pageCount);
		model.addAttribute("prePage", prePage);
		model.addAttribute("nextPage", nextPage);
		model.addAttribute("jobEOCurrentPage", jobEOCurrentPage);
		model.addAttribute("list", list);
		return "jobEOInfo/jobEOInfoList";
	}
	
	@RequestMapping("/searchJobEOByDeptId")
	public String searchJobEOByDeptId(int optionId, Model model) {
		JobEvaluateOption jobEvaluateOption = null;
		if(optionId == -1){
			return "redirect:getSubJobEO.do?pageNum = 1";
		}
		jobEvaluateOption = jobEOBiz.getJEOByOptionId(optionId);
		List<JobEvaluateOption> list = new ArrayList<JobEvaluateOption>();
		list.add(jobEvaluateOption);
		
		model.addAttribute("list", list);
		model.addAttribute("optionId", optionId);
		return "jobEOInfo/jobEOInfoList";
	}
	
	@RequestMapping("/getAddJobEOPage")
	public String getAddJobEOPage(){
		return "jobEOInfo/addJobEOInfo";
	}
	
	@RequestMapping("addJobEO")
	public String addJobEO(JobEvaluateOption jobEvaluateOption, Model model){
		if (jobEOBiz.addJobEvaluateOption(jobEvaluateOption)) {
			model.addAttribute("addMsg", "您已成功添加数据!");
		} else {
			model.addAttribute("addMsg", "您未能成功添加数据!!!");
		}
		return "jobEOInfo/addJobEOInfo";
	}
	
	@RequestMapping("/getJobEOByOptionId")
	public String getJobEOByOptionId(int optionId, Model model){
		JobEvaluateOption jobEvaluateOption = null;
		jobEvaluateOption = jobEOBiz.getJEOByOptionId(optionId);
		model.addAttribute("jobEvaluateOption", jobEvaluateOption);
		return "jobEOInfo/jobEODetailInfo";
	}
	
	@RequestMapping("/editJobEO")
	public String editJobEO(int optionId, Model model){
		JobEvaluateOption jobEvaluateOption = null;
		jobEvaluateOption = jobEOBiz.getJEOByOptionId(optionId);
		model.addAttribute("jobEvaluateOption", jobEvaluateOption);
		return "jobEOInfo/editJobEOInfo";
	}
	
	@RequestMapping("/saveJobEO")
	public String saveJobEO(JobEvaluateOption jobEvaluateOption, Model model){
		
		if (jobEOBiz.editJobEvaluateOption(jobEvaluateOption)) {
			model.addAttribute("jobEvaluateOption", jobEvaluateOption);
			model.addAttribute("editMsg", "您已成功修改数据!");
		} else {
			model.addAttribute("jobEvaluateOption", jobEvaluateOption);
			model.addAttribute("editMsg", "您未能成功修改数据!!!");
		}
		return "jobEOInfo/jobEODetailInfo";
	}
	
	@RequestMapping("/delJobEO")
	public String delJobEO(String optionIdArr, HttpSession session, Model model){
		if(optionIdArr==null){
			model.addAttribute("delMsg","您未选中要删除的信息!");
			return "getSubJobEO.do";
		}
		String[] str = optionIdArr.split(",");
		if (jobEOBiz.delJobEvaluateOption(str)) {
			model.addAttribute("delMsg", "删除成功!");
		} else {
			model.addAttribute("delMsg", "删除失败!!!");
			
		}
		return "redirect:getSubJobEO.do?pageNum="+session.getAttribute("jobEOCurrentPage");
	}
	
}
