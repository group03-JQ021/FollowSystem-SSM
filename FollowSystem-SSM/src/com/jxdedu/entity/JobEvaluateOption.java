package com.jxdedu.entity;

/**
 * 评价分项表
 * 
 * @author Administrator
 *
 */
public class JobEvaluateOption {
	private int optionid; // 分项id
	private String optionName; // 分项名称
	private String optionState; // 分项状态(是否在用)

	public JobEvaluateOption() {
		super();
	}

	public JobEvaluateOption(int optionid, String optionName, String optionState) {
		super();
		this.optionid = optionid;
		this.optionName = optionName;
		this.optionState = optionState;
	}

	public int getOptionid() {
		return optionid;
	}

	public void setOptionid(int optionid) {
		this.optionid = optionid;
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

}
