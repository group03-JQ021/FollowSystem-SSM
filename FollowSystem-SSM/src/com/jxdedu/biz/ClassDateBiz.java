package com.jxdedu.biz;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.jxdedu.entity.ClassDate;

public interface ClassDateBiz {
	/**
	 * 获取所有的班级信息
	 * @return 班级集合
	 */
	List<ClassDate> getAllClassDate();
}
