package com.team1.dadoc.challenges.dto;

public class ChallengesDto {

	private int num;
	private String type;
	private String writer;
	private String title;
	private String category;
	private String imagePath;
	private String description;
	private int period;
	private String startDate;
	private String endDate;
	private String regdate;
	private int startRowNum;
	private int endRowNum;
	private int prevNum;
	private int nextNum;
	
	//디폴트 생성자
	public ChallengesDto() {}

	public ChallengesDto(int num, String type, String writer, String title, String category, String imagePath,
			String description, int period, String startDate, String endDate, String regdate, int startRowNum,
			int endRowNum, int prevNum, int nextNum) {
		super();
		this.num = num;
		this.type = type;
		this.writer = writer;
		this.title = title;
		this.category = category;
		this.imagePath = imagePath;
		this.description = description;
		this.period = period;
		this.startDate = startDate;
		this.endDate = endDate;
		this.regdate = regdate;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
		this.prevNum = prevNum;
		this.nextNum = nextNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getStartRowNum() {
		return startRowNum;
	}

	public void setStartRowNum(int startRowNum) {
		this.startRowNum = startRowNum;
	}

	public int getEndRowNum() {
		return endRowNum;
	}

	public void setEndRowNum(int endRowNum) {
		this.endRowNum = endRowNum;
	}

	public int getPrevNum() {
		return prevNum;
	}

	public void setPrevNum(int prevNum) {
		this.prevNum = prevNum;
	}

	public int getNextNum() {
		return nextNum;
	}

	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}

	
	
	
	
}
