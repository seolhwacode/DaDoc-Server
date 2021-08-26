package com.team1.dadoc.challenger.dto;

public class ChallengerDto {

	private int num;
	private String id;
	private String challengeTitle;
	private int period;
	private int stamp;
	private String success;
	
	public ChallengerDto() {}
	
	public ChallengerDto(int num, String id, String challengeTitle, int period, int stamp, String success) {
		super();
		this.num = num;
		this.id = id;
		this.challengeTitle = challengeTitle;
		this.period = period;
		this.stamp = stamp;
		this.success = success;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getChallengeTitle() {
		return challengeTitle;
	}

	public void setChallengeTitle(String challengeTitle) {
		this.challengeTitle = challengeTitle;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public int getStamp() {
		return stamp;
	}

	public void setStamp(int stamp) {
		this.stamp = stamp;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}
	
	
}
