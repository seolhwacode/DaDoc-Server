package com.team1.dadoc.book.good.dao;

import com.team1.dadoc.book.good.dto.BookGoodDto;

public interface BookGoodDao {
	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 return
	public boolean getIsGood(BookGoodDto dto);
	//id 와 isbn 을 db 에 추가 -> 결과를 boolean 값으로 받아옴
	public boolean insertGood(BookGoodDto dto);
	//id 와 isbn 이 일치하는 row 를 db 에서 삭제 -> 결과를 boolean 값으로 받아옴
	public boolean deleteGood(BookGoodDto dto);
}
