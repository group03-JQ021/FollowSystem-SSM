package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.EvaluateDate;

/**
 * 评价时间节点表dao接口
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public interface EvaluateDateDao {
	/**
	 * 添加评价时间节点
	 * @param evaluateDate 时间节点对象
	 * @return	是否添加成功
	 */
	boolean addEvaluateDate(EvaluateDate evaluateDate);

	/**
	 * 删除评价时间节点
	 * @param arr 评价时间节点id数组
	 * @return 是否添加成功
	 */
	boolean delEvaluateDate(String[] arr);

	/**
	 * 修改评价时间节点
	 * @param evaluateDate 评价时间节点对象
	 * @return 是否添加成功
	 */
	boolean editEvaluateDate(EvaluateDate evaluateDate);

	/**
	 * 获取评价时间节点的记录数
	 * @return 评价时间节点的记录数
	 */
	int getEDRowNum();

	/**
	 * 分页查询
	 * @param startIndex 开始行号
	 * @param endIndex 结束行号
	 * @return 分页查询获取到的评价时间节点集合
	 */
	List<EvaluateDate> getSubEvaluateDate(int startIndex, int endIndex);

	/**
	 * 模糊查询
	 * @param dateName 节点名称
	 * @return 查询出节点名称包含输入的名称的评价时间节点集合
	 */
	List<EvaluateDate> likeSearchED(String dateName);

	/**
	 * 通过节点名称获取评价时间节点
	 * @param dateName 节点名称
	 * @return 评价时间节点
	 */
	EvaluateDate getEDByDateName(String dateName);

	/**
	 * 通过节点id获取评价时间节点
	 * @param dateId 节点id
	 * @return 评价时间节点
	 */
	EvaluateDate getEDByDateId(int dateId);

}
