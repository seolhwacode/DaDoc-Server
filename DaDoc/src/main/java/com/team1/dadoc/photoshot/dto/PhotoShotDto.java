package com.team1.dadoc.photoshot.dto;

import org.springframework.web.multipart.MultipartFile;

public class PhotoShotDto {
	
	private int num;
	private String id;
	private String challengeTitle;
	private String imagePath;
	private String regdate;
	private int period;
	private int shotNum;
	private String saveFileName;
	private String orgFileName;
	private MultipartFile image; // 이미지 파일 업로드 처리를 위한 필드

	
	public PhotoShotDto() {}


	public PhotoShotDto(int num, String id, String challengeTitle, String imagePath, String regdate, int period,
			int shotNum, String saveFileName, String orgFileName, MultipartFile image) {
		super();
		this.num = num;
		this.id = id;
		this.challengeTitle = challengeTitle;
		this.imagePath = imagePath;
		this.regdate = regdate;
		this.period = period;
		this.shotNum = shotNum;
		this.saveFileName = saveFileName;
		this.orgFileName = orgFileName;
		this.image = image;
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


	public String getImagePath() {
		return imagePath;
	}


	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	public int getPeriod() {
		return period;
	}


	public void setPeriod(int period) {
		this.period = period;
	}


	public int getShotNum() {
		return shotNum;
	}


	public void setShotNum(int shotNum) {
		this.shotNum = shotNum;
	}


	public String getSaveFileName() {
		return saveFileName;
	}


	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}


	public String getOrgFileName() {
		return orgFileName;
	}


	public void setOrgFileName(String orgFileName) {
		this.orgFileName = orgFileName;
	}


	public MultipartFile getImage() {
		return image;
	}


	public void setImage(MultipartFile image) {
		this.image = image;
	}


	


	
}
