package com.jxdedu.entity;

/**
 * 评价分项表
 * 
 * @author 孙加硕
 * @date 2018年6月24日
 */
public class JobEvaluateOption {
	private int optionId;// 分项id
	private String optionName;// 分项名称
	private String optionState;// 分项状态(是否在用)

	public JobEvaluateOption() {
		super();
		// TODO Auto-generated constructor stub
	}

	public JobEvaluateOption(int optionId, String optionName, String optionState) {
		super();
		this.optionId = optionId;
		this.optionName = optionName;
		this.optionState = optionState;
	}

	public int getOptionId() {
		return optionId;
	}

	public void setOptionId(int optionId) {
		this.optionId = optionId;
	}

	public String getOptionName() {
		return optionName;
	}

	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}

	public String getOptionState() {
		return optionState;
	}

	public void setOptionState(String optionState) {
		this.optionState = optionState;
	}

	@Override
	public String toString() {
		return "JobEvaluateOption [optionId=" + optionId + ", optionName=" + optionName + ", optionState=" + optionState
				+ "]";
	}

}
