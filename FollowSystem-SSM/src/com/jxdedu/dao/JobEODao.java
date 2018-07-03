package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.JobEvaluateOption;

/**
 * 工作评价分项表dao接口
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public interface JobEODao {
	
	/**
	 * 获取所有评价分项的记录数
	 * @return 工作评价分项的记录数
	 */
	int getJEORowNum();

	/**
	 * 分页查询
	 * @param startIndex 开始行
	 * @param endIndex 结束行
	 * @return 查询评价分项集合
	 */
	List<JobEvaluateOption> getSubJobEO(int startIndex, int endIndex);

	/**
	 * 通过分项id查询工作评价分项
	 * @param optionId 分项id
	 * @return 工作查询分项
	 */
	JobEvaluateOption getJEOByOptionId(int optionId);

	/**
	 * 添加工作评价分项
	 * @param jobEvaluateOption 插入的工作评价分项对象
	 * @return 是否添加成功
	 */
	boolean addJobEvaluateOption(JobEvaluateOption jobEvaluateOption);

	/**
	 * 修改工作评价分项
	 * @param jobEvaluateOption 需要修改的工作评价分项对象
	 * @return 是否修改成功
	 */

	boolean editJobEvaluateOption(JobEvaluateOption jobEvaluateOption);

	/**
	 * 删除工作评价分项
	 * @param arr 工作评价分项id数组
	 * @return 是否删除成功
	 */
	 boolean delJobEvaluateOption(String[] arr);

	/**
		 * 模糊查询
		 * 
		 * @param optionName
		 *            工作评价分项名称
		 * @return 包含输入名称的工作评价分项集合
		 */
	/*
	 * List<JobEvaluateOption> likeSearchJEO(String optionName);
	 * 
	 *//**
		 * 通过分项名称查询工作评价分项
		 * 
		 * @param optionName
		 *            分项名称
		 * @return 工作评价分项
		 */
	/*
	 * JobEvaluateOption getJEOByOptionName(String optionName);
	 * 
	 */

}
