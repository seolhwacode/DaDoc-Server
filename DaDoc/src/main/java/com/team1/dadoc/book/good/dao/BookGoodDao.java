package com.team1.dadoc.book.good.dao;

import com.team1.dadoc.book.good.dto.BookGoodDto;

public interface BookGoodDao {
	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 return
	public boolean getIsGood(BookGoodDto dto);
}
