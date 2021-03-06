package com.team1.dadoc.photoshot.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team1.dadoc.photoshot.dto.PhotoShotDto;

@Repository
public class PhotoShotDaoImpl implements PhotoShotDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(PhotoShotDto dto) {
		session.insert("photoShot.insert",dto);
	}

	@Override
	public List<PhotoShotDto> getPhotoShot(String id) {
		return session.selectList("photoShot.getPhotoShot", id);
	}

	@Override
	public int getPeriod(PhotoShotDto photoDto) {
		return session.selectOne("photoShot.getPeriod", photoDto);
	}

}
