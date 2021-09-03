package com.team1.dadoc.notice.service;

import javax.servlet.http.HttpServletRequest;


import com.team1.dadoc.notice.dto.NoticeDto;

public interface NoticeService {

	public void getList(HttpServletRequest request);
	public void getDetail(HttpServletRequest request);
	public void saveContent(NoticeDto dto);
	public void updateContent(NoticeDto dto);
	public void deleteContent(int num, HttpServletRequest request);
	public void getData(HttpServletRequest request);
}
