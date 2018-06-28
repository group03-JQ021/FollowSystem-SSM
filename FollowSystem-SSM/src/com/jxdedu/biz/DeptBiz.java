package com.jxdedu.biz;

import java.util.List;

import com.jxdedu.entity.Dept;
/**
 * 
 * @author 孙加硕
 * @date 2018年6月25日
 */
public interface DeptBiz {
	
	/**
	 * 获取总记录数
	 * @return
	 */
	int getDeptRowNum();
	
	/**
	 * 分页查询
	 * @return
	 */
	List<Dept> getSubDept(int startIndex,int endIndex);

	/**
	 * 根据部门名称进行模糊查询
	 * @param deptName 部门名称
	 * @return 包含输入的部门名称的部门集合
	 */
	List<Dept> fuzzySearchDept(String deptName);
	
	/**
	 * 添加新的部门
	 * @param dept 添加的部门对象
	 * @return 是否添加成功
	 */
	boolean addDept(Dept dept);
	
	/**
	 * 通过部门编号获取部门信息
	 * @param deptId 部门编号
	 * @return 对应的该部门对象
	 */
	Dept getDeptByDeptId(int deptId);
	
	/**
	 * 修改部门信息
	 * @param dept 需要修改的部门	
	 * @return 修改是否成功
	 */
	boolean editDept(Dept dept);
}
