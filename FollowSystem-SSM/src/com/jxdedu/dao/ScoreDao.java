package com.jxdedu.dao;

import java.util.List;

import com.jxdedu.entity.Score;

/**
 * 实体类Score(学生考核成绩)的数据访问层接口定义;
 * @ClassName ScoreDao
 * @author 陈希展 
 * @date 2018年6月13日
 */
public interface ScoreDao {
    /**
     * 添加一条成绩记录.
     * @param score 要添加的成绩对象
     * @return  true,如果操作成功; false 如果操作失败
     */
    boolean addScore(Score score);
    /**
     * 更新成绩信息;
     * 根据学生 ID 和课程 ID 更新其成绩.
     * @param score 要更新的数据.
     * @return  true,如果更新成功; false,如果更新失败;
     */
    boolean updateScore(Score score);

    /**
     * 获取所有成绩记录
     * @return  由Score对象构成的列表; 其内包含数据库中所有成绩条目.
     */
    List<Score> getAllScore();
    /**
     * 查询记录总数.
     * @return 数据库中,成绩记录总数.
     */
    int getTotalCount();
    
}

