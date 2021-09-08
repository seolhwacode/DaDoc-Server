package com.team1.dadoc.book.good.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.book.good.dto.BookGoodDto;

//bean 이 될 수 있도록
@Repository
public class BookGoodDaoImpl implements BookGoodDao {

	//필요한 핵심 의존 객체
	@Autowired
	private SqlSession session;

	/*
	 * Mapper's namespace : bookGood
	 * sql's id : isExist
	 * parameterType : BookGoodDto
	 * resultType : string (해당 isbn 을 읽어올 것)
	 */
	//해당 id 와 isbn 에 해당하는 값이 좋아요 리스트에 있는지 확인하고, 그 값을 boolean 값으로 return
	@Override
	public boolean getIsGood(BookGoodDto dto) {
		String isbn = session.selectOne("bookGood.isExist", dto);
		
		System.out.println(isbn);
		
		//select 한 값이 null -> 존재 X -> false
		if(isbn == null) {
			return false;
		}
		//값이 존재 -> true
		return true;
	}
	
	
}
