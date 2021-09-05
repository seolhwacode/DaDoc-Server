package com.team1.dadoc.book.search.dto;

public class BookSearchDto {
	private String query;	//검색을 원하는 문자열로서 UTF-8로 인코딩한다.
	private int display;	//검색 결과 출력 건수 지정
	private int start;	//검색 시작 위치로 최대 1000까지 가능
	private String sort;	//정렬 옵션: sim(유사도순), date(출간일순), count(판매량순)
	//d_00 : 상세 검색만 해당
	private String d_titl;	//책 제목 검색
	private String d_auth;	//저자명 검색
	private String d_cont; 	//목차 검색
	private String d_isbn;	//isbn 검색
	private String d_publ;	//출판사 검색
	private String d_dafr;	//출간 시작일(ex.20000203)
	private String d_dato;	//출간 종료일(ex.20000203)
	private String d_catg;	//책 검색 카테고리
	
	//기본 생성자
	public BookSearchDto() {}

	public BookSearchDto(String query, int display, int start, String sort, String d_titl, String d_auth, String d_cont,
			String d_isbn, String d_publ, String d_dafr, String d_dato, String d_catg) {
		super();
		this.query = query;
		this.display = display;
		this.start = start;
		this.sort = sort;
		this.d_titl = d_titl;
		this.d_auth = d_auth;
		this.d_cont = d_cont;
		this.d_isbn = d_isbn;
		this.d_publ = d_publ;
		this.d_dafr = d_dafr;
		this.d_dato = d_dato;
		this.d_catg = d_catg;
	}

	public String getQuery() {
		return query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public String getD_titl() {
		return d_titl;
	}

	public void setD_titl(String d_titl) {
		this.d_titl = d_titl;
	}

	public String getD_auth() {
		return d_auth;
	}

	public void setD_auth(String d_auth) {
		this.d_auth = d_auth;
	}

	public String getD_cont() {
		return d_cont;
	}

	public void setD_cont(String d_cont) {
		this.d_cont = d_cont;
	}

	public String getD_isbn() {
		return d_isbn;
	}

	public void setD_isbn(String d_isbn) {
		this.d_isbn = d_isbn;
	}

	public String getD_publ() {
		return d_publ;
	}

	public void setD_publ(String d_publ) {
		this.d_publ = d_publ;
	}

	public String getD_dafr() {
		return d_dafr;
	}

	public void setD_dafr(String d_dafr) {
		this.d_dafr = d_dafr;
	}

	public String getD_dato() {
		return d_dato;
	}

	public void setD_dato(String d_dato) {
		this.d_dato = d_dato;
	}

	public String getD_catg() {
		return d_catg;
	}

	public void setD_catg(String d_catg) {
		this.d_catg = d_catg;
	}
	
}
