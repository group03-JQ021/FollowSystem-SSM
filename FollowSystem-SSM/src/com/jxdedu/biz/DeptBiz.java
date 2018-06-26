package com.jxdedu.biz;

import java.util.List;

import com.jxdedu.entity.Dept;

public interface DeptBiz {
	/**
	 * 编辑部门信息
	 * @param dept	部门
	 * @return	是否编辑成功
	 */
	boolean editDept(Dept dept);
	/**
	 * 添加部门信息
	 * @param dept 部门
	 * @return	是否编辑成功
	 */
	boolean addDept(Dept dept);
	/**
	 * 得到所有部门信息
	 * @return	所有部门列表
	 */
	List<Dept> getAllDept();
	/**
	 * 根据部门编号查询部门信息
	 * @param deptId 部门编号
	 * @return	部门信息
	 */
	Dept getOneDeptById(int deptId);
	/**
	 * 删除部门信息
	 * @param deptId 部门ID
	 * @return 是否删除成功
	 */
	boolean delDept(String deptId);
	/**
	 * 分页查询部门信息
	 * @param startIndex 开始页码
	 * @param endIndex 结束页码
	 * @return	部门信息
	 */
	List<Dept> getSubDept(int startIndex,int endIndex);
	/**
	 * 获取所有记录条数
	 * @return	记录条数
	 */
	int getRowNum();
}
