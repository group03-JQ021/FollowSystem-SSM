package com.jxdedu.entity;

/**
 * 学校评价实体类.
 * @ClassName SchoolEvaluation
 * @author 陈希展 
 * @date 2018年6月14日
 */
/*
 schoolevaluation;
 名称                     类型
 EVALUATEID             NUMBER(7)
 STUID                  NUMBER(7)
 EVALUATEPERSON         VARCHAR2(20)
 EVALUATESCORE          NUMBE(4,2)
 EVALUATECONTENT        VARCHAR2(200)
 */
public class SchoolEvaluation {
   
    private Integer evaluateId; // 评价 ID,对应主键
    private Integer stuId;      // 学生 ID,对应外键
    private double evaluateScore;  // 评分
    private String evaluateContent; // 评语
    private String evaluatePerson;  // 评价人
    // 构造器
    public SchoolEvaluation() {}
    public SchoolEvaluation(Integer evaluateId, Integer stuId, Integer evaluateScore, 
            String evaluateContent, String evaluatePerson) {
        this.evaluateId = evaluateId;
        this.stuId = stuId;
        this.evaluateScore = evaluateScore;
        this.evaluateContent = evaluateContent;
        this.evaluatePerson = evaluatePerson;
    }
	public Integer getEvaluateId() {
		return evaluateId;
	}
	public void setEvaluateId(Integer evaluateId) {
		this.evaluateId = evaluateId;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public double getEvaluateScore() {
		return evaluateScore;
	}
	public void setEvaluateScore(double evaluateScore) {
		this.evaluateScore = evaluateScore;
	}
	public String getEvaluateContent() {
		return evaluateContent;
	}
	public void setEvaluateContent(String evaluateContent) {
		this.evaluateContent = evaluateContent;
	}
	public String getEvaluatePerson() {
		return evaluatePerson;
	}
	public void setEvaluatePerson(String evaluatePerson) {
		this.evaluatePerson = evaluatePerson;
	}
}
