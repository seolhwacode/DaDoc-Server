package com.team1.dadoc.users.dto;

public class UsersDto {
	private String id;	//아이디
	private String pwd;	//비밀번호
	private String name;	//이름(실명)
	private String nickname;	//닉네임
	private String tel;	//휴대전화번호
	private String email;	//이메일
	private int sex;	//성별 : 0(남자), 1(여자), 2(그 외)
	private String birth;	//생년월일
	private String profile;	//프로필 이미지 경로
	private String regdate;	//가입일
	private int pwd_question;	//users_pwd_question 테이블의 pk
	private String pwd_answer;	//사용자의 대답. 단답형
	private int tos;	//광고 수신 동의 : 0(동의X), 1(동의O)
	
	public UsersDto() {}

	public UsersDto(String id, String pwd, String name, String nickname, String tel, String email, int sex, String birth,
			String profile, String regdate, int pwd_question, String pwd_answer, int point, int tos) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.tel = tel;
		this.email = email;
		this.sex = sex;
		this.birth = birth;
		this.profile = profile;
		this.regdate = regdate;
		this.pwd_question = pwd_question;
		this.pwd_answer = pwd_answer;
		this.tos = tos;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getPwd_question() {
		return pwd_question;
	}

	public void setPwd_question(int pwd_question) {
		this.pwd_question = pwd_question;
	}

	public String getPwd_answer() {
		return pwd_answer;
	}

	public void setPwd_answer(String pwd_answer) {
		this.pwd_answer = pwd_answer;
	}

	public int getTos() {
		return tos;
	}

	public void setTos(int tos) {
		this.tos = tos;
	}
	
	
}
