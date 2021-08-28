package com.team1.dadoc.photoshot.dao;


import java.util.List;

import com.team1.dadoc.photoshot.dto.PhotoShotDto;


public interface PhotoShotDao {
	//인증샷 업로드하기
	public void insert(PhotoShotDto dto);
	// 인증샷 가져오기
	public List<PhotoShotDto> getPhotoShot(PhotoShotDto dto);
}
