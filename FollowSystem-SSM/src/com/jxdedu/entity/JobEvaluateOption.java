package com.jxdedu.entity;

/**
 * 评价分项表
 * 
 * @author Administrator
 *
 */
public class JobEvaluateOption {
	private int optionId; // 分项id
	private String optionName; // 分项名称
	private String optionState; // 分项状态(是否在用)
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

	

}
