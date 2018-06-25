package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Score;

/**
 * 成绩类dao层接口
 * @author 孙加硕
 * @date 2018年6月25日
 */
public interface ScoreDao {
	/**
	 * 添加成绩
	 * @param score 成绩
	 * @return 是否添加成功
	 */
	boolean addScore(Score score);
	/**
	 * 批量删除成绩
	 * @param arr 被选中的学生id数组
	 * @return 是否删除成功
	 */
	boolean delScore(String[] arr);
	/**
	 * 修改成绩
	 * @param score 需要修改的成绩对象
	 * @return 是否删除成功
	 */
	boolean editScore(Score score);
	/**
	 * 获取所有的学生记录数
	 * @return 学生的总数
	 */
	int getScoreRowNum();
	/**
	 * 分页查询
	 * @param startIndex  开始行
	 * @param endIndex 结束行
	 * @return 分页查询获取到的数据
	 */
	List<Score> getSubScore(int startIndex,int endIndex);
	/*List<Score> likeSearchScore(String);*/
	/**
	 * 通过学生id获取 成绩
	 * @param stuId 学生id
	 * @return 成绩
	 */
	Score getScoreByStuId(int stuId);
	/**
	 * 通过课程id获取成绩
	 * @param courseId 课程id
	 * @return 成绩
	 */
	Score getScoreByCourseId(int courseId);
	/**
	 * 通过学生id和课程id获取成绩
	 * @param stuId 学生id
	 * @param CourseId 课程id
	 * @return 获取到的成绩
	 */
	Score getScoreByStuIdCourseId(int stuId,int CourseId);
	
}
