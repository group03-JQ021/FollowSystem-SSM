package com.jxdedu.biz;

import java.util.List;


import com.jxdedu.entity.SchoolEvaluation;

/**
 * 学校评价数据访问层
 * @ClassName SchoolEvaluationDao
 * @author 陈希展 
 * @date 2018年6月14日
 */
public interface SchoolEvaluationBiz {
    /**
     * 添加一条评价记录
     * @param evaluation    评价信息
     * @return  true,如果添加成功; false,如果添加失败
     */
    boolean addSchoolEvaluation(SchoolEvaluation evaluation);
    /**
     * 更新一条评价记录.
     * 根据给定评价记录的id,更新其它字段;
     * @param newEvaluation     要更新的评价记录
     * @return  true,如果更新操作成功; false,如果更新操作失败
     */
    boolean updateSchoolEvaluation(SchoolEvaluation newEvaluation);
    /**
     * 获取所有评价信息.
     * 查询结果放在 Map 对象中,以评价信息的 ID 为键,以评价信息对象为值.
     * 当查询结果为空时,返回的map对象不含任何键值对;
     * 当查询失败时,返回null.
     * @return  包含了所有评价信息的映射集合. 或者 null 如果查询失败; 
     */
    List<SchoolEvaluation> getAllSchoolEvaluation();
    /**
     * 查找具有给定ID的评价信息
     * @param evaluation    封装了ID的评价信息对象
     * @return  查找到的评价信息; 如果查找失败,返回 null
     */
    SchoolEvaluation    getSchoolEvaluationByID(SchoolEvaluation evaluation);
    /**
     * 获取数据库中评价信息的总数.
     * @return  评价信息总数. 如果查询失败,则返回 -1.
     */
    int     getTotalCount();
    
    SchoolEvaluation  getSchoolEvaluationBystuId(int stuId);
}

