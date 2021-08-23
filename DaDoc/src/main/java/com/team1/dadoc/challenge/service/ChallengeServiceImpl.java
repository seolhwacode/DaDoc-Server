package com.team1.dadoc.challenge.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team1.dadoc.challenges.dao.ChallengesDao;
import com.team1.dadoc.challenges.dto.ChallengesDto;

@Service
public class ChallengeServiceImpl implements ChallengeService {

	@Autowired
	private ChallengesDao dao;
	
	// 새로운 챌린지 등록하는 메소드
	@Override
	public void register(ChallengesDto dto) {
		dao.register(dto);
	}
	
	// 챌린지 리스트 가져오는 메소드
	@Override
	public void getList(HttpServletRequest request) {
		//한 페이지에 몇개씩 표시할 것인지
				final int PAGE_ROW_COUNT=8;
				//하단 페이지를 몇개씩 표시할 것인지
				final int PAGE_DISPLAY_COUNT=5;
			   
				//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
				int pageNum=1;
				//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
				String strPageNum = request.getParameter("pageNum");
				//만일 페이지 번호가 파라미터로 넘어 온다면
				if(strPageNum != null){
					//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
					pageNum=Integer.parseInt(strPageNum);
				}
			   
				//보여줄 페이지의 시작 ROWNUM
				int startRowNum = 1 + (pageNum-1) * PAGE_ROW_COUNT;
				//보여줄 페이지의 끝 ROWNUM
				int endRowNum = pageNum * PAGE_ROW_COUNT;
			   
				//startRowNum 과 endRowNum  을 ChallengesDto 객체에 담고
				ChallengesDto dto = new ChallengesDto();
				dto.setStartRowNum(startRowNum);
				dto.setEndRowNum(endRowNum);
			   
				//ChallengesDto 객체를 이용해서 회원 목록을 얻어온다.
				List<ChallengesDto> list = dao.getList(dto);
			   
				//하단 시작 페이지 번호 
				int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
				//하단 끝 페이지 번호
				int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
			   
				//전체 row 의 갯수
				int totalRow = dao.getCount();
				//전체 페이지의 갯수 구하기
				int totalPageCount = (int)Math.ceil(totalRow / (double)PAGE_ROW_COUNT);
				//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
				if(endPageNum > totalPageCount){
					endPageNum = totalPageCount; //보정해 준다. 
				}
				
				//request 영역에 담아주기
				request.setAttribute("list", list);	//challenges list
				request.setAttribute("startPageNum", startPageNum);	//시작 페이지 번호
				request.setAttribute("endPageNum", endPageNum);	//끝 페이지 번호
				request.setAttribute("pageNum", pageNum);	//현재 페이지 번호
				request.setAttribute("totalPageCount", totalPageCount);	//모든 페이지 count
	}
}
