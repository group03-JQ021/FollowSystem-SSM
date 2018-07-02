package com.jxdedu.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jxdedu.entity.ClassDate;

public interface ClassDateDao {
	/**
	 * 获取所有的班级信息
	 * @return 班级集合
	 */
	@Select("select * from classdate order by classId")
	List<ClassDate> getAllClassDate();
}
