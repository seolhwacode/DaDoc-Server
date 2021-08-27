package com.team1.dadoc.photoshot.dao;


import com.team1.dadoc.photoshot.dto.PhotoShotDto;


public interface PhotoShotDao {
	//인증샷 업로드하기
	public void insert(PhotoShotDto dto);
}
