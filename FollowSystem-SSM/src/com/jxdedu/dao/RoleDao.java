package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Course;
import com.jxdedu.entity.Roletable;

public interface RoleDao {
	/**
	 * 添加角色信息到数据库
	 * @param role 要添加的角色对象
	 * @return 是否添加成功
	 */
	boolean addRole(Roletable role);
	/**
	 * 编辑角色信息
	 * @param role 要编辑的角色对象
	 * @return 是否编辑成功
	 */
	boolean editRole(Roletable role);
	/**
	 * 根据角色id删除角色信息
	 * @param roleid 角色id 
	 * @return 是否删除成功
	 */
	boolean delRole(int roleid);
	/**
	 * 得到所有的角色信息
	 * @return 角色信息列表
	 */
	List<Roletable> getAllRole();
	/**
	 * 分页查询
	 * @param startIndex 开始页
	 * @param endIndex 结束页
	 * @return 课程信息
	 */
	List<Roletable> getSubRole(int startIndex,int endIndex);
	/**
	 * 获取记录总条数
	 * @return 记录条数
	 */
	int getRowNum();
	/**
	 * 根据角色id查询角色信息
	 * @param roleid 角色id
	 * @return 角色信息
	 */
	Course getRoleByRoleId(int roleid);
}
