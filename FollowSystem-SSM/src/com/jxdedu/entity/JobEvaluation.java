
package com.jxdedu.entity;


public class JobEvaluation {
	private int dateId;
	private int stuId; 
	private int optionId;
	private String evaluatePerson;
	private double evaluateScore;
	private double totalScore;
	private String jobEvaluateContent;
	private JobEvaluateOption JobEvaluateOption;
	private EvaluateDate EvaluateDate;
	public JobEvaluateOption getJobEvaluateOption() {
		return JobEvaluateOption;
	}
	public void setJobEvaluateOption(JobEvaluateOption jobEvaluateOption) {
		JobEvaluateOption = jobEvaluateOption;
	}
	public EvaluateDate getEvaluateDate() {
		return EvaluateDate;
	}
	public void setEvaluateDate(EvaluateDate evaluateDate) {
		EvaluateDate = evaluateDate;
	}


	public int getDateId() {
		return dateId;
	}
	public void setDateId(int dateId) {
		this.dateId = dateId;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public int getOptionId() {
		return optionId;
	}
	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}
	public String getEvaluatePerson() {
		return evaluatePerson;
	}
	public void setEvaluatePerson(String evaluatePerson) {
		this.evaluatePerson = evaluatePerson;
	}
	public double getEvaluateScore() {
		return evaluateScore;
	}
	public void setEvaluateScore(double evaluateScore) {
		this.evaluateScore = evaluateScore;
	}
	public double getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(double totalScore) {
		this.totalScore = totalScore;
	}
	public String getJobEvaluateContent() {
		return jobEvaluateContent;
	}
	public void setJobEvaluateContent(String jobEvaluateContent) {
		this.jobEvaluateContent = jobEvaluateContent;
	}
    public JobEvaluation(int dateId, int stuId, int optionId, String evaluatePerson, double evaluateScore,
			double totalScore, String jobEvaluateContent, com.jxdedu.entity.JobEvaluateOption jobEvaluateOption,
			com.jxdedu.entity.EvaluateDate evaluateDate) {
		super();
		this.dateId = dateId;
		this.stuId = stuId;
		this.optionId = optionId;
		this.evaluatePerson = evaluatePerson;
		this.evaluateScore = evaluateScore;
		this.totalScore = totalScore;
		this.jobEvaluateContent = jobEvaluateContent;
		JobEvaluateOption = jobEvaluateOption;
		EvaluateDate = evaluateDate;
	}
	public JobEvaluation() {
		super();
	}
	@Override
    public String toString() {
        String str = String.format("{日期ID:%s,学生ID:%s,综合评分:%d}",
                dateId, stuId, totalScore);
        return str;
    }
}
