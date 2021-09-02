package com.team1.dadoc.trade.dto;

public class TradeCommentDto {

	private int num;	//댓글의 글번호
	private String writer;	//댓글 작성자의 아이디
	private String content;	//댓글 내용
	private String target_id;	//댓글에 댓글을 달았을 때, 그 댓글의 작성자 id
	private int ref_group;	//댓글을 단 게시글 번호(num)
	private int comment_group;	//게시글에 작성한 댓글 번호(게시글에 댓글 or 댓글에 댓글 인지 확인 가능)
	private String deleted;	//no : 삭제 X, yes : 삭제 => 삭제된 댓글입니다. 출력
	private String regdate;	//작성일
	private String profile;	//users 의 profile (join 해야함 - writer = id)
	private int startRowNum;	//댓글 보여줄 row 시작 num
	private int endRowNum;	//댓글 보여줄 row 끝 num
	
	public TradeCommentDto() {}

	public TradeCommentDto(int num, String writer, String content, String target_id, int ref_group, int comment_group,
			String deleted, String regdate, String profile, int startRowNum, int endRowNum) {
		super();
		this.num = num;
		this.writer = writer;
		this.content = content;
		this.target_id = target_id;
		this.ref_group = ref_group;
		this.comment_group = comment_group;
		this.deleted = deleted;
		this.regdate = regdate;
		this.profile = profile;
		this.startRowNum = startRowNum;
		this.endRowNum = endRowNum;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTarget_id() {
		return target_id;
	}

	public void setTarget_id(String target_id) {
		this.target_id = target_id;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}

	public int getComment_group() {
		return comment_group;
	}

	public void setComment_group(int comment_group) {
		this.comment_group = comment_group;
	}

	public String getDeleted() {
		return deleted;
	}

	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
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
	
	
}
