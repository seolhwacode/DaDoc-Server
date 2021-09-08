package com.team1.dadoc.book.good.dto;

public class BookGoodDto {
	private String id;		//사용자 id
	private String isbn;	//책의 isbn
	
	//기본 생성자
	public BookGoodDto() {}

	public BookGoodDto(String id, String isbn) {
		super();
		this.id = id;
		this.isbn = isbn;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	
}
