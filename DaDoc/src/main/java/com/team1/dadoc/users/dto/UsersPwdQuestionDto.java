package com.team1.dadoc.users.dto;

public class UsersPwdQuestionDto {
	private int num;	//pk
	private String question;	//질문 내용
	
	public UsersPwdQuestionDto() {}

	public UsersPwdQuestionDto(int num, String question) {
		super();
		this.num = num;
		this.question = question;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	
}
