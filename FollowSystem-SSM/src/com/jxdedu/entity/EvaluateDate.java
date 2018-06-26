package com.jxdedu.entity;

/**
 * 评价时间节点表
 * 
 * @author Administrator
 *
 */
public class EvaluateDate {
	private int dateId; // 节点
	private String dateName; // 节点名称

	public EvaluateDate() {
		super();
	}

	public EvaluateDate(int dateId, String dateName) {
		super();
		this.dateId = dateId;
		this.dateName = dateName;
	}

	public int getDateId() {
		return dateId;
	}

	public void setDateId(int dateId) {
		this.dateId = dateId;
	}

	public String getDateName() {
		return dateName;
	}

	public void setDateName(String dateName) {
		this.dateName = dateName;
	}

}
