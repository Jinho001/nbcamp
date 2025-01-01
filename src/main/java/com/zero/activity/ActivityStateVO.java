package com.zero.activity;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ActivityStateVO {
	private int actId;
	private int stateId;
	private String actName;
	private String userid;
	private int state;
	private String stateName;
	private String startDate;
	private String endDate;
	private String ctfcFilename;
	
	//추가된 필드
	private String timeLeft;
}
