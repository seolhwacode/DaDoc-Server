package com.team1.dadoc.notice.dao;

import java.util.List;


import com.team1.dadoc.notice.dto.NoticeDto;

public interface NoticeDao {

	public List<NoticeDto> getList(NoticeDto dto);
	
	public int getCount(NoticeDto dto);
	
	public void insert(NoticeDto dto);
	
	public NoticeDto getData(int num);
	
	public NoticeDto getDate(NoticeDto dto);
	
	public void delete(int num);
		
	public void update(NoticeDto dto);
	
}
