package com.jxdedu.test;

import com.jxdedu.biz.impl.StudentBizImpl;

public class Test {

	public static void main(String[] args) {
		StudentBizImpl sbi = new StudentBizImpl();
		String[] stuIdArr = {"8","10"};
		if(sbi.delStudents(stuIdArr)){
			System.out.println("删除成功!");
		}else{
			System.out.println("删除失败!");
		}
		
	}
}
